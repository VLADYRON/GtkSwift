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

public protocol GridProtocol: ContainerProtocol, Buildable {
  mutating func attach(widget: Widget, left: gint, top: gint, width: gint, height: gint)
}

public struct Grid: Object, GridProtocol {
  public let handle: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkGrid>) {
    handle = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  public init() {
    self.init(gtk_grid_new())
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension GridProtocol {
  var grid: UnsafeMutablePointer<GtkGrid> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkGrid>.self)
  }
  
  public mutating func attach(widget: Widget, left: gint, top: gint, width: gint = 1, height: gint = 1) {
    gtk_grid_attach(grid, widget.widget, left, top, width, height)
  }
}
