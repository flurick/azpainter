# AzPainter

prefix := /usr/local
bindir := /usr/local/bin
datarootdir := /usr/local/share
datadir := /usr/local/share/azpainter
package_name := azpainter
package_version := 2.1.6
package_full := $(package_name)-$(package_version)

instfile := install -m 644

CC := clang
CFLAGS := -O2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -pthread -Isrc/include -Imlib/include -I. -DHAVE_CONFIG_H \
 -DPACKAGE_DATA_DIR=\"$(datadir)\"
LDFLAGS :=  -pthread
LIBS := -lrt -lpng16 -lz -ljpeg -lX11 -lXext -lXi -lfontconfig -lfreetype -lm

TARGET := azpainter

SRCS := src/AppCursor.c \
src/AppResource.c \
src/ConfigData.c \
src/configfile.c \
src/main.c \
src/draw/draw_boxedit.c \
src/draw/draw_calc.c \
src/draw/draw_canvas.c \
src/draw/draw_image.c \
src/draw/draw_layer.c \
src/draw/draw_load_adw.c \
src/draw/draw_load_apd_v1v2.c \
src/draw/draw_loadsave_apd_v3.c \
src/draw/draw_loadsave_psd.c \
src/draw/draw_main.c \
src/draw/draw_op_brush.c \
src/draw/draw_op_func1.c \
src/draw/draw_op_func2.c \
src/draw/draw_op_main.c \
src/draw/draw_op_spline.c \
src/draw/draw_op_sub.c \
src/draw/draw_op_xor.c \
src/draw/draw_rule.c \
src/draw/draw_save_image.c \
src/draw/draw_select.c \
src/draw/draw_update.c \
src/filter/PerlinNoise.c \
src/filter/filter_antialiasing.c \
src/filter/filter_blur.c \
src/filter/filter_color.c \
src/filter/filter_comic.c \
src/filter/filter_draw.c \
src/filter/filter_effect.c \
src/filter/filter_mediancut.c \
src/filter/filter_other1.c \
src/filter/filter_subfunc.c \
src/filter/filter_transform.c \
src/image/ImageBuf24.c \
src/image/ImageBuf8.c \
src/image/ImageBufRGB16.c \
src/image/ImageBufRGB16_canvas.c \
src/image/PixbufDraw.c \
src/image/TileImage.c \
src/image/TileImage_draw.c \
src/image/TileImage_draw_brush.c \
src/image/TileImage_draw_sub.c \
src/image/TileImage_edit.c \
src/image/TileImage_imagefile.c \
src/image/TileImage_pixel.c \
src/image/TileImage_pv.c \
src/image/TileImage_scaling.c \
src/image/TileImage_select.c \
src/image/TileImage_type_a1.c \
src/image/TileImage_type_a16.c \
src/image/TileImage_type_gray.c \
src/image/TileImage_type_rgba.c \
src/image/blendcol.c \
src/other/BrushItem.c \
src/other/BrushList.c \
src/other/BrushSizeList.c \
src/other/ColorPalette.c \
src/other/ColorValue.c \
src/other/DrawFill.c \
src/other/DrawFont.c \
src/other/DrawPointBuf.c \
src/other/FillPolygon.c \
src/other/FilterSaveData.c \
src/other/GradationList.c \
src/other/LayerItem.c \
src/other/LayerList.c \
src/other/MaterialImgList.c \
src/other/SinTable.c \
src/other/SplineBuf.c \
src/other/Undo.c \
src/other/UndoItem.c \
src/other/UndoItem_base.c \
src/other/UndoItem_sub.c \
src/other/UndoItem_tileimg.c \
src/other/file_apd_v3.c \
src/other/undo_compress.c \
src/widget/BrushDetailDlg.c \
src/widget/BrushListEdit.c \
src/widget/CanvasCtrlBar.c \
src/widget/CanvasDialogs.c \
src/widget/CanvasKeyDlg.c \
src/widget/ColorWheel.c \
src/widget/DockBrush.c \
src/widget/DockBrushList.c \
src/widget/DockBrushSize.c \
src/widget/DockBrushValue.c \
src/widget/DockCanvasCtrl.c \
src/widget/DockCanvasView.c \
src/widget/DockCanvasViewArea.c \
src/widget/DockCanvasView_dlg.c \
src/widget/DockColor.c \
src/widget/DockColorPalette.c \
src/widget/DockColorPalette_colpal.c \
src/widget/DockColorPalette_editpaldlg.c \
src/widget/DockColorPalette_gradbar.c \
src/widget/DockColorPalette_hlspal.c \
src/widget/DockColorPalette_tab.c \
src/widget/DockColorWheel.c \
src/widget/DockColor_tab.c \
src/widget/DockColor_widget.c \
src/widget/DockFilterList.c \
src/widget/DockImageViewer.c \
src/widget/DockImageViewerArea.c \
src/widget/DockLayer.c \
src/widget/DockLayer_area.c \
src/widget/DockLayer_param.c \
src/widget/DockObject.c \
src/widget/DockOption.c \
src/widget/DockOption_other.c \
src/widget/DockOption_tool.c \
src/widget/DockOption_tool_grad.c \
src/widget/DockTool.c \
src/widget/DrawTextDlg.c \
src/widget/EnvOptDlg.c \
src/widget/EnvOptDlg_btt.c \
src/widget/EnvOptDlg_ct1.c \
src/widget/FileDialog.c \
src/widget/FilterBar.c \
src/widget/FilterDlg.c \
src/widget/FilterPrev.c \
src/widget/FilterWgLevel.c \
src/widget/FilterWgRepcol.c \
src/widget/GradationEditDlg.c \
src/widget/GradationEditWidget.c \
src/widget/GridOptDlg.c \
src/widget/LayerColorDlg.c \
src/widget/LayerDialogs.c \
src/widget/MainWinCanvas.c \
src/widget/MainWindow.c \
src/widget/MainWindow_cmd.c \
src/widget/MainWindow_file.c \
src/widget/MainWindow_filter.c \
src/widget/MainWindow_layer.c \
src/widget/NewImageDlg.c \
src/widget/PanelLayoutDlg.c \
src/widget/PopupSliderZoom.c \
src/widget/PopupThread.c \
src/widget/PressureWidget.c \
src/widget/PrevCursor.c \
src/widget/PrevImage8.c \
src/widget/PrevTileImage.c \
src/widget/SaveOptionDlg.c \
src/widget/SelMaterial.c \
src/widget/SelMaterialDlg.c \
src/widget/ShortcutKeyDlg.c \
src/widget/StatusBar.c \
src/widget/ToolBarCustomizeDlg.c \
src/widget/TransformDlg.c \
src/widget/TransformViewArea.c \
src/widget/TransformViewArea_sub.c \
src/widget/ValueBar.c \
src/widget/calc_homography.c

OBJS := $(SRCS:.c=.o)
DEPS := $(OBJS:.o=.d)

update_cache := if test -z "$(DESTDIR)";then \
 echo "** Updating cache"; \
 gtk-update-icon-cache -f -t $(datarootdir)/icons/hicolor; \
 update-desktop-database $(datarootdir)/applications; \
 update-mime-database $(datarootdir)/mime; fi

#-----------------

.PHONY: all clean install uninstall dist

all: $(TARGET)

mlib/libmlib.a:
	$(MAKE) -C mlib

$(TARGET): $(OBJS) mlib/libmlib.a
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -MMD -MP -MF $(@:.o=.d) -o $@ $<

clean:
	rm -f $(TARGET) $(OBJS) $(DEPS)
	$(MAKE) -C mlib clean

install:
	install -m 755 -d $(DESTDIR)$(bindir) \
	 $(DESTDIR)$(datarootdir)/applications \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/48x48/apps \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/apps \
	 $(DESTDIR)$(datarootdir)/mime/packages \
	 $(DESTDIR)$(datadir)/doc \
	 $(DESTDIR)$(datadir)/13x13 \
	 $(DESTDIR)$(datadir)/16x16 \
	 $(DESTDIR)$(datadir)/20x20 \
	 $(DESTDIR)$(datadir)/24x24 \
	 $(DESTDIR)$(datadir)/brush \
	 $(DESTDIR)$(datadir)/theme \
	 $(DESTDIR)$(datadir)/tr \
	 $(DESTDIR)$(datadir)/texture/tone300 \
	 $(DESTDIR)$(datadir)/texture/tone600 \
	 $(DESTDIR)$(datadir)/texture/various

	install -m 755 $(TARGET) $(DESTDIR)$(bindir)
	$(instfile) desktop/applications/azpainter.desktop $(DESTDIR)$(datarootdir)/applications
	$(instfile) desktop/icons/hicolor/48x48/apps/*.png $(DESTDIR)$(datarootdir)/icons/hicolor/48x48/apps
	$(instfile) desktop/icons/hicolor/scalable/apps/*.svg $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/apps
	$(instfile) desktop/mime/packages/azpainter.xml $(DESTDIR)$(datarootdir)/mime/packages

	$(instfile) GPL3 AUTHORS ChangeLog README README_ja manual_ja.html $(DESTDIR)$(datadir)/doc

	$(instfile) data/*.dat data/*.png data/sckey-2.conf $(DESTDIR)$(datadir)

	$(instfile) data/13x13/* $(DESTDIR)$(datadir)/13x13
	$(instfile) data/16x16/* $(DESTDIR)$(datadir)/16x16
	$(instfile) data/20x20/* $(DESTDIR)$(datadir)/20x20
	$(instfile) data/24x24/* $(DESTDIR)$(datadir)/24x24
	$(instfile) data/brush/* $(DESTDIR)$(datadir)/brush
	$(instfile) data/theme/* $(DESTDIR)$(datadir)/theme
	$(instfile) data/tr/* $(DESTDIR)$(datadir)/tr

	$(instfile) data/texture/tone300/* $(DESTDIR)$(datadir)/texture/tone300
	$(instfile) data/texture/tone600/* $(DESTDIR)$(datadir)/texture/tone600
	$(instfile) data/texture/various/* $(DESTDIR)$(datadir)/texture/various

	@-$(update_cache)

uninstall:
	rm -f $(DESTDIR)$(bindir)/$(TARGET) \
	 $(DESTDIR)$(datarootdir)/applications/azpainter.desktop \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/48x48/apps/azpainter.png \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/48x48/apps/application-x-azpainter-apd.png \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/apps/azpainter.svg \
	 $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/apps/application-x-azpainter-apd.svg \
	 $(DESTDIR)$(datarootdir)/mime/packages/azpainter.xml

	rm -rf $(DESTDIR)$(datadir)

	@-$(update_cache)

dist:
	tar czf $(package_full).tar.gz \
	 AUTHORS ChangeLog configure config.h.in GPL3 Makefile.in manual_ja.html README README_ja \
	 data desktop translation src mlib/Makefile.in mlib/include mlib/src

	if test ! -d $(package_full);then mkdir $(package_full); fi
	tar xf $(package_full).tar.gz -C $(package_full)
	tar cf $(package_full).tar.xz -I "xz -9" $(package_full)
	rm $(package_full).tar.gz
	rm -r $(package_full)

-include $(DEPS)
