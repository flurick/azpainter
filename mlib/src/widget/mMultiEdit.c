/*$
 Copyright (C) 2013-2020 Azel.

 This file is part of AzPainter.

 AzPainter is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 AzPainter is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
$*/

/*****************************************
 * mMultiEdit
 *****************************************/

#include "mDef.h"
#include "mWidget.h"
#include "mScrollView.h"
#include "mScrollBar.h"
#include "mEvent.h"
#include "mStr.h"

#include "mMultiEdit.h"
#include "mMultiEditArea.h"
#include "mEditTextBuf.h"


/***********************//**

@defgroup multiedit mMultiEdit
@brief 複数行エディタ

- 改行は '\\n' で統一される。
- スクロールバーはデフォルトであり。自動で処理される。

<h2>継承</h2>
mWidget \> mMultiEdit

@ingroup group_widget
@{

@file mMultiEdit.h
@def M_MULTIEDIT(p)
@struct mMultiEditData
@struct mMultiEdit
@enum MMULTIEDIT_STYLE
@enum MMULTIEDIT_NOTIFY

**************************/



//===========================
// sub
//===========================


/** CONSTRUCT イベント追加 */

static void _send_const(mMultiEdit *p)
{
	mWidgetAppendEvent_only(M_WIDGET(p), MEVENT_CONSTRUCT);
}


//===========================
// main
//===========================


/** 破棄ハンドラ */

void mMultiEditDestroyHandle(mWidget *wg)
{
	mEditTextBuf_free(((mMultiEdit *)wg)->me.buf);
}

/** 作成 */

mMultiEdit *mMultiEditNew(int size,mWidget *parent,uint32_t style)
{
	mMultiEdit *p;
	
	if(size < sizeof(mMultiEdit)) size = sizeof(mMultiEdit);
	
	p = (mMultiEdit *)mScrollViewNew(size, parent, MSCROLLVIEW_S_HORZVERT | MSCROLLVIEW_S_FRAME);
	if(!p) return NULL;
	
	p->wg.destroy = mMultiEditDestroyHandle;
	p->wg.event = mMultiEditEventHandle;
	
	p->wg.fState |= MWIDGET_STATE_TAKE_FOCUS;
	p->wg.fEventFilter |= MWIDGET_EVENTFILTER_KEY | MWIDGET_EVENTFILTER_CHAR | MWIDGET_EVENTFILTER_STRING;
	p->wg.fAcceptKeys = MWIDGET_ACCEPTKEY_ENTER;

	p->me.style = style;

	//mEditTextBuf
	
	p->me.buf = mEditTextBuf_new(M_WIDGET(p), TRUE);
	if(!p->me.buf)
	{
		mWidgetDestroy(M_WIDGET(p));
		return NULL;
	}

	//mMultiEditArea

	p->sv.area = (mScrollViewArea *)mMultiEditAreaNew(0, M_WIDGET(p), p->me.buf);
	
	return p;
}

/** 作成 */

mMultiEdit *mMultiEditCreate(mWidget *parent,int id,uint32_t style,uint32_t fLayout,uint32_t marginB4)
{
	mMultiEdit *p;

	p = mMultiEditNew(0, parent, style);
	if(!p) return NULL;

	p->wg.id = id;
	p->wg.fLayout = fLayout;

	mWidgetSetMargin_b4(M_WIDGET(p), marginB4);

	return p;
}

/** テキストセット */

void mMultiEditSetText(mMultiEdit *p,const char *text)
{
	mEditTextBuf_setText(p->me.buf, text);

	mScrollBarSetPos(p->sv.scrh, 0);
	mScrollBarSetPos(p->sv.scrv, 0);

	mMultiEditArea_onChangeCursorPos(M_MULTIEDITAREA(p->sv.area));

	_send_const(p);
}

/** テキストを取得 */

void mMultiEditGetTextStr(mMultiEdit *p,mStr *str)
{
	mStrSetTextUCS4(str, p->me.buf->text, p->me.buf->textLen);
}

/** テキストの長さを取得 */

int mMultiEditGetTextLen(mMultiEdit *p)
{
	return p->me.buf->textLen;
}

/** 全て選択 (フォーカスがあることが前提) */

void mMultiEditSelectAll(mMultiEdit *p)
{
	if((p->wg.fState & MWIDGET_STATE_FOCUSED)
			&& mEditTextBuf_selectAll(p->me.buf))
		mWidgetUpdate(M_WIDGET(p->sv.area));
}


//========================
// ハンドラ
//========================


/** イベント */

int mMultiEditEventHandle(mWidget *wg,mEvent *ev)
{
	mMultiEdit *p = M_MULTIEDIT(wg);

	switch(ev->type)
	{
		//キーイベントは mMultiEditArea へ送る
		case MEVENT_KEYDOWN:
		case MEVENT_CHAR:
		case MEVENT_STRING:
			((p->sv.area)->wg.event)(M_WIDGET(p->sv.area), ev);
			break;

		//構成
		case MEVENT_CONSTRUCT:
			mMultiEditArea_setScrollInfo(M_MULTIEDITAREA(p->sv.area));
			
			mScrollViewConstruct(M_SCROLLVIEW(p));
			mWidgetUpdate(M_WIDGET(p->sv.area));
			break;

		//フォーカス
		case MEVENT_FOCUS:
			if(ev->focus.bOut)
				//[OUT] 選択解除
				p->me.buf->selTop = -1;
			else
			{
				//[IN] タブでの移動時、すべて選択
				
				if(ev->focus.by == MEVENT_FOCUS_BY_TABMOVE)
					mEditTextBuf_selectAll(p->me.buf);
			}
			
			mWidgetUpdate(M_WIDGET(p->sv.area));
			break;
		default:
			return FALSE;
	}

	return TRUE;
}

/* @} */
