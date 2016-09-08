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

public protocol BuilderProtocol: ObjectProtocol {
  func connectSignals()
  subscript(object: String) -> ApplicationWindow? {
    get
  }
  subscript(object: String) -> Bin? {
    get
  }
  subscript(object: String) -> Box? {
    get
  }
  subscript(object: String) -> Button? {
    get
  }
  subscript(object: String) -> ButtonBox? {
    get
  }
  subscript(object: String) -> Container? {
    get
  }
  subscript(object: String) -> Widget? {
    get
  }
  subscript(object: String) -> Window? {
    get
  }
}

public struct Builder: Object, BuilderProtocol {
  public let handle: UnsafeMutableRawPointer
  
  init(_ ptr: UnsafeMutablePointer<GtkBuilder>) {
    handle = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
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


extension BuilderProtocol {
  var builder: UnsafeMutablePointer<GtkBuilder> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkBuilder>.self)
  }
  
  public func connectSignals() {
    gtk_builder_connect_signals(builder, nil);
  }
//  @available(*, deprecated, message: "Will be removed when generic subscripts are available!")
//  public func get<T: Buildable>(_ widget: String) -> T? {
//    return T(gtk_builder_get_object(builder, object))
//  }
  public subscript(object: String) -> Button? {
    return Button(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> Widget? {
    return Widget(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> Window? {
    return Window(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> ApplicationWindow? {
    return ApplicationWindow(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> Bin? {
    return Bin(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> Container? {
    return Container(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> Box? {
    return Box(gtk_builder_get_object(builder, object))
  }
  public subscript(object: String) -> ButtonBox? {
    return ButtonBox(gtk_builder_get_object(builder, object))
  }
}
