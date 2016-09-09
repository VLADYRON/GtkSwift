///*
// * GtkSwift Copyright (C) 2016 Tim Diekmann
// * mailto: t.diekmann.3dv@gmail.com
// *
// * This program is free software: you can redistribute it and/or modify
// * it under the terms of the GNU General Public License as published by
// * the Free Software Foundation, either version 3 of the License, or
// * (at your option) any later version.
// *
// * This program is distributed in the hope that it will be useful,
// * but WITHOUT ANY WARRANTY; without even the implied warranty of
// * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// * GNU General Public License for more details.
// *
// * You should have received a copy of the GNU General Public License
// * along with this program. If not, see <http://www.gnu.org/licenses/>.
// */
//
//import CGtk
//
//public class Object {
//  var gtkPointer: UnsafeMutablePointer<GObject>
//  init(ptr: UnsafeMutablePointer<GObject>) {
//    gtkPointer = ptr
//    g_object_ref(gtkPointer)
//  }
//
//  convenience init?(ptr: UnsafeMutablePointer<GObject>?) {
//    guard let ptr = ptr else {
//      return nil
//    }
//    self.init(ptr: ptr)
//  }
//  convenience init(ptr: UnsafeMutableRawPointer) {
//    self.init(ptr: unsafeBitCast(ptr, to: UnsafeMutablePointer<GObject>.self))
//  }
//  convenience init?(ptr: UnsafeMutableRawPointer?) {
//    guard let ptr = ptr else {
//      return nil
//    }
//    self.init(ptr: ptr)
//  }
//  deinit {
//    g_object_unref(gtkPointer)
//  }
//
//
//  func get<T:Property>(property: String) -> T? {
//    let value = UnsafeMutablePointer<GValue>.allocate(capacity: 1)
//    defer { value.deallocate(capacity: 1) }
//    value.initialize(to: GValue())
//    defer { value.deinitialize() }
//    g_value_init(value, T.propertyType)
//    defer { g_value_unset(value) }
//    g_object_get_property(gtkPointer, property, value)
//    return T(from: value)
//  }
//  func set<T:Property>(property: String, to newValue: T)  {
//    let value = UnsafeMutablePointer<GValue>.allocate(capacity: 1)
//    defer { value.deallocate(capacity: 1) }
//    value.initialize(to: GValue())
//    defer { value.deinitialize() }
//    g_value_init(value, T.propertyType)
//    defer { g_value_unset(value) }
//    newValue.write(into: value)
//    g_object_set_property(gtkPointer, property, value)
//  }
//
//}