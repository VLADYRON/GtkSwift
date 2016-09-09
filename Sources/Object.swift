/// 
/// This file is part of GtkSwift. Copyright (C) 2016  Tim Diekmann
/// 
/// GtkSwift is free software: you can redistribute it and/or modify
/// it under the terms of the GNU Lesser General Public License as published 
/// by the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
/// 
/// GtkSwift is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU Lesser General Public License for more details.
/// 
/// You should have received a copy of the GNU Lesser General Public License
/// along with GtkSwift. If not, see <http://www.gnu.org/licenses/>.
/// 

import CGtk

public class Object {
  var object: UnsafeMutablePointer<GObject>
  init(from ptr: UnsafeMutablePointer<GObject>) {
    assert(g_object_get_data(object, "swift-instance") == nil, "This function should not be called directly. Use Object.make instead!")
    object = ptr
    let data = Unmanaged.passRetained(self).toOpaque()
    let destructor: @convention(c) (UnsafeMutableRawPointer) -> Void = { Unmanaged<AnyObject>.fromOpaque($0).release() }
    g_object_set_data_full(object, "swift-instance", data, unsafeBitCast(destructor, to: GDestroyNotify.self))
  }

  class func make(_ object: UnsafeMutablePointer<GObject>) -> Object {
    if let instance = g_object_get_data(object, "swift-instance") {
      return Unmanaged.fromOpaque(instance).takeUnretainedValue()
    } else {
      return Object(from: object)
    }
  }

  func get<T:Property>(property: String) -> T? {
    let value = UnsafeMutablePointer<GValue>.allocate(capacity: 1)
    defer { value.deallocate(capacity: 1) }
    value.initialize(to: GValue())
    defer { value.deinitialize() }
    g_value_init(value, T.propertyType)
    defer { g_value_unset(value) }
    g_object_get_property(object, property, value)
    return T(from: value)
  }
  func set<T:Property>(property: String, to newValue: T)  {
    let value = UnsafeMutablePointer<GValue>.allocate(capacity: 1)
    defer { value.deallocate(capacity: 1) }
    value.initialize(to: GValue())
    defer { value.deinitialize() }
    g_value_init(value, T.propertyType)
    defer { g_value_unset(value) }
    newValue.write(into: value)
    g_object_set_property(object, property, value)
  }
}
