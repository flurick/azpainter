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

#ifndef MLIB_PSD_DEF_H
#define MLIB_PSD_DEF_H

enum MPSD_COLMODE
{
	MPSD_COLMODE_MONO = 0,
	MPSD_COLMODE_GRAYSCALE,
	MPSD_COLMODE_INDEX,
	MPSD_COLMODE_RGB,
	MPSD_COLMODE_CMYK,
	MPSD_COLMODE_MULTI_CHANNELS,
	MPSD_COLMODE_HALFTONE,
	MPSD_COLMODE_LAB
};

enum MPSD_BLENDMODE
{
	MPSD_BLENDMODE_NORMAL        = ('n'<<24)|('o'<<16)|('r'<<8)|'m',
	MPSD_BLENDMODE_DISSOLVE      = ('d'<<24)|('i'<<16)|('s'<<8)|'s',
	MPSD_BLENDMODE_DARKEN        = ('d'<<24)|('a'<<16)|('r'<<8)|'k',
	MPSD_BLENDMODE_MULTIPLY      = ('m'<<24)|('u'<<16)|('l'<<8)|' ',
	MPSD_BLENDMODE_BURN          = ('i'<<24)|('d'<<16)|('i'<<8)|'v',
	MPSD_BLENDMODE_LINEAR_BURN   = ('l'<<24)|('b'<<16)|('r'<<8)|'n',
	MPSD_BLENDMODE_DARKER_COL    = ('d'<<24)|('k'<<16)|('C'<<8)|'l',
	MPSD_BLENDMODE_LIGHTEN       = ('l'<<24)|('i'<<16)|('t'<<8)|'e',
	MPSD_BLENDMODE_SCREEN        = ('s'<<24)|('c'<<16)|('r'<<8)|'n',
	MPSD_BLENDMODE_DODGE         = ('d'<<24)|('i'<<16)|('v'<<8)|' ',
	MPSD_BLENDMODE_LINEAR_DODGE  = ('l'<<24)|('d'<<16)|('d'<<8)|'g',
	MPSD_BLENDMODE_LIGHTER_COL   = ('l'<<24)|('g'<<16)|('C'<<8)|'l',
	MPSD_BLENDMODE_OVERLAY       = ('o'<<24)|('v'<<16)|('e'<<8)|'r',
	MPSD_BLENDMODE_SOFT_LIGHT    = ('s'<<24)|('L'<<16)|('i'<<8)|'t',
	MPSD_BLENDMODE_HARD_LIGHT    = ('h'<<24)|('L'<<16)|('i'<<8)|'t',
	MPSD_BLENDMODE_VIVID_LIGHT   = ('v'<<24)|('L'<<16)|('i'<<8)|'t',
	MPSD_BLENDMODE_LINEAR_LIGHT  = ('l'<<24)|('L'<<16)|('i'<<8)|'t',
	MPSD_BLENDMODE_PIN_LIGHT     = ('p'<<24)|('L'<<16)|('i'<<8)|'t',
	MPSD_BLENDMODE_HARD_MIX      = ('h'<<24)|('M'<<16)|('i'<<8)|'x',
	MPSD_BLENDMODE_DIFFERENCE    = ('d'<<24)|('i'<<16)|('f'<<8)|'f',
	MPSD_BLENDMODE_EXCLUSION     = ('s'<<24)|('m'<<16)|('u'<<8)|'d',
	MPSD_BLENDMODE_SUBTRACT      = ('f'<<24)|('s'<<16)|('u'<<8)|'b',
	MPSD_BLENDMODE_DIVIDE        = ('f'<<24)|('d'<<16)|('i'<<8)|'v',
	MPSD_BLENDMODE_HUE           = ('h'<<24)|('u'<<16)|('e'<<8)|' ',
	MPSD_BLENDMODE_SATURATION    = ('s'<<24)|('a'<<16)|('t'<<8)|' ',
	MPSD_BLENDMODE_COLOR         = ('c'<<24)|('o'<<16)|('l'<<8)|'r',
	MPSD_BLENDMODE_LUMINOSITY    = ('l'<<24)|('u'<<16)|('m'<<8)|' '
};

enum MPSD_CHANNEL_ID
{
	MPSD_CHANNEL_ID_RED = 0,
	MPSD_CHANNEL_ID_GREEN = 1,
	MPSD_CHANNEL_ID_BLUE = 2,
	MPSD_CHANNEL_ID_ALPHA = 0xffff,
	MPSD_CHANNEL_ID_MASK = 0xfffe
};

#endif
