/*
 * CGtk Copyright (C) 2016 Tim Diekmann
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

public protocol WidgetProtocol {
  typealias Pointer = UnsafeMutablePointer<GtkWidget>
}
public struct Widget: WidgetProtocol, Object, Buildable {
  public var underlying: UnsafeMutablePointer<GtkWidget>
  
  init(_ ptr: UnsafeMutableRawPointer) {
    underlying = unsafeBitCast(ptr, to: Pointer.self)
  }
}

public extension Object where Self: WidgetProtocol {
  public func showAll() {
    gtk_widget_show_all(underlying)
  }
  
  public func destroy() {
    gtk_widget_destroy(underlying)
  }
  
  var destroyed: DestroyedSignal {
    return DestroyedSignal(instance: underlying)
  }
}
