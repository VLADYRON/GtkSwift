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

public class Object: Handle {
  public var gPointer: UnsafeMutablePointer<CGtk.GObject>
  public required init(from pointer: UnsafeMutablePointer<CGtk.GObject>) {
    gPointer = pointer
  }
}

public struct PropertyIterator : IteratorProtocol {
  public typealias Element = (name: String, value: Any)

  public mutating func next() -> Element? {
    let paramSpecs = object.gParamSpecs
    guard position < paramSpecs.count else { return nil }
    let paramSpec = paramSpecs[position]
    position += 1
    guard paramSpec.pointee.flags.rawValue & G_PARAM_READABLE.rawValue == G_PARAM_READABLE.rawValue else {
      return next()
    }
    let valueType = paramSpec.pointee.value_type
    let paramName = String(cString: paramSpec.pointee.name)

    var returnValue: Any = String(cString: g_type_name(valueType))

    let value = UnsafeMutablePointer<GValue>.allocate(capacity: 1)
    defer { value.deallocate(capacity: 1) }
    value.initialize(to: GValue())
    defer { value.deinitialize()}
    g_value_init(value, valueType)
    defer { g_value_unset(value) }
    g_object_get_property(object.gPointer, paramName, value)
    switch valueType {
      case g_type_boolean(): returnValue = g_value_get_boolean(value) != 0
      case g_type_int(): returnValue = g_value_get_int(value)
      case g_type_uint(): returnValue = g_value_get_uint(value)
      case g_type_boxed(): returnValue = g_type_name(paramSpec.pointee.owner_type)
      case g_type_string():
        guard let string = g_value_get_string(value) else { returnValue = "nil"; break }
        returnValue = String(cString: string)
      default: break
    }
//    g_object_get_property(handle, property, value)
//    return T(from: value)


    return (name: paramName, value: returnValue)
  }

  private var object: Object
  private var position: Int = 0

  init(object: Object) {
    self.object = object
  }

}

extension Object: Class, Sequence {
  public typealias Iterator = PropertyIterator
  public func makeIterator() -> Iterator {
    return Iterator(object: self)
  }
}