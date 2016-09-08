/*
 * GtkSwift Copyright (C) 2016 Tim Diekmann
 * mailto: t.diekmann.3dv@gmail.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import CGtk

public enum WindowTypeHint {
	case Normal
	case Dialog
	case Menu
	case Toolbar
	case SplashScreen
	case Utility
	case Dock
	case Desktop
	case DropDownMenu
	case PopupMenu
	case Tooltip
	case Notification
	case Combo
	case DND
	
	internal var value: GdkWindowTypeHint { get{
		switch self {
		case .Normal:
			return GDK_WINDOW_TYPE_HINT_NORMAL
		case .Dialog:
			return GDK_WINDOW_TYPE_HINT_DIALOG
		case .Menu:
			return GDK_WINDOW_TYPE_HINT_MENU
		case .Toolbar:
			return GDK_WINDOW_TYPE_HINT_TOOLBAR
		case .SplashScreen:
			return GDK_WINDOW_TYPE_HINT_SPLASHSCREEN
		case .Utility:
			return GDK_WINDOW_TYPE_HINT_UTILITY
		case .Dock:
			return GDK_WINDOW_TYPE_HINT_DOCK
		case .Desktop:
			return GDK_WINDOW_TYPE_HINT_DESKTOP
		case .DropDownMenu:
			return GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU
		case .PopupMenu:
			return GDK_WINDOW_TYPE_HINT_POPUP_MENU
		case .Tooltip:
			return GDK_WINDOW_TYPE_HINT_TOOLTIP
		case .Notification:
			return GDK_WINDOW_TYPE_HINT_NOTIFICATION
		case .Combo:
			return GDK_WINDOW_TYPE_HINT_COMBO
		case .DND:
			return GDK_WINDOW_TYPE_HINT_DND
		}
	}}
	internal static func make(value: GdkWindowTypeHint) -> WindowTypeHint {
		switch value {
		case GDK_WINDOW_TYPE_HINT_DIALOG:
			return Dialog
		case GDK_WINDOW_TYPE_HINT_MENU:
			return Menu
		case GDK_WINDOW_TYPE_HINT_TOOLBAR:
			return Toolbar
		case GDK_WINDOW_TYPE_HINT_SPLASHSCREEN:
			return SplashScreen
		case GDK_WINDOW_TYPE_HINT_UTILITY:
			return Utility
		case GDK_WINDOW_TYPE_HINT_DOCK:
			return Dock
		case GDK_WINDOW_TYPE_HINT_DESKTOP:
			return Desktop
		case GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU:
			return DropDownMenu
		case GDK_WINDOW_TYPE_HINT_POPUP_MENU:
			return PopupMenu
		case GDK_WINDOW_TYPE_HINT_TOOLTIP:
			return Tooltip
		case GDK_WINDOW_TYPE_HINT_NOTIFICATION:
			return Notification
		case GDK_WINDOW_TYPE_HINT_COMBO:
			return Combo
		case GDK_WINDOW_TYPE_HINT_DND:
			return DND
		default:
			return .Normal
		}
	}
}
