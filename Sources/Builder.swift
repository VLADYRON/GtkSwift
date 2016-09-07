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

public protocol BuilderProtocol {
  typealias Pointer = UnsafeMutablePointer<GtkBuilder>
}
public struct Builder: BuilderProtocol, Object, Buildable {
  public var underlying: UnsafeMutablePointer<GtkBuilder>
  
  init(_ ptr: UnsafeMutableRawPointer) {
    underlying = unsafeBitCast(ptr, to: Pointer.self)
  }
  public init() {
    self.init(gtk_builder_new()!)
  }
  public init(fromFile path: String) {
    self.init(gtk_builder_new_from_file(path)!)
  }
  public init(fromResource path: String) {
    self.init(gtk_builder_new_from_resource(path)!)
  }
  public init(fromString string: String) {
    self.init(gtk_builder_new_from_string(string, string.characters.count)!)
  }
}

public extension Object where Self: BuilderProtocol {
  public subscript(widget: String) -> Button? {
    return Button(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> Widget? {
    return Widget(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> Window? {
    return Window(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> ApplicationWindow? {
    return ApplicationWindow(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> Bin? {
    return Bin(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> Container? {
    return Container(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> Box? {
    return Box(gtk_builder_get_object(underlying, widget))
  }
  public subscript(widget: String) -> ButtonBox? {
    return ButtonBox(gtk_builder_get_object(underlying, widget))
  }
}
