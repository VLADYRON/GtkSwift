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

public enum IconSize {
  case Invalid
  case Menu
  case SmallToolbar
  case LargeToolbar
  case Button
  case DND
  case Dialog
  
  internal var value: GtkIconSize {
    switch self {
    case .Invalid:
      return GTK_ICON_SIZE_INVALID
    case .Menu:
      return GTK_ICON_SIZE_MENU
    case .SmallToolbar:
      return GTK_ICON_SIZE_SMALL_TOOLBAR
    case .LargeToolbar:
      return GTK_ICON_SIZE_LARGE_TOOLBAR
    case .Button:
      return GTK_ICON_SIZE_BUTTON
    case .DND:
      return GTK_ICON_SIZE_DND
    case .Dialog:
      return GTK_ICON_SIZE_DIALOG
    }
  }
  internal static func make(value: GtkIconSize) -> IconSize {
    switch value {
    case GTK_ICON_SIZE_INVALID:
      return Invalid
    case GTK_ICON_SIZE_MENU:
      return Menu
    case GTK_ICON_SIZE_SMALL_TOOLBAR:
      return SmallToolbar
    case GTK_ICON_SIZE_LARGE_TOOLBAR:
      return LargeToolbar
    case GTK_ICON_SIZE_BUTTON:
      return Button
    case GTK_ICON_SIZE_DND:
      return DND
    default:
      return Dialog
    }
  }
}
