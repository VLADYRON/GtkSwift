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

protocol Property {
  static var propertyType: GType { get }
  init?(from: UnsafeMutablePointer<GValue>)
  func write(into: UnsafeMutablePointer<GValue>)
}

extension CBool: Property {
  static var propertyType: GType {
    return g_type_from_name("gboolean")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_boolean(value) != 0)
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_boolean(value, self ? 1 : 0)
  }
}

extension CChar: Property {
  static var propertyType: GType {
    return g_type_from_name("gchar")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_schar(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_schar(value, self)
  }
}

extension CUnsignedChar: Property {
  static var propertyType: GType {
    return g_type_from_name("guchar")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_uchar(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_uchar(value, self)
  }
}

extension CInt: Property {
  static var propertyType: GType {
    return g_type_from_name("gint")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_int(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_int(value, self)
  }
}

extension CUnsignedInt: Property {
  static var propertyType: GType {
    return g_type_from_name("guint")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_uint(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_uint(value, self)
  }
}

extension CLong: Property {
  static var propertyType: GType {
    return g_type_from_name("glong")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_long(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_long(value, self)
  }
}

extension CUnsignedLong: Property {
  static var propertyType: GType {
    return g_type_from_name("gulong")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_ulong(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_ulong(value, self)
  }
}

extension CFloat: Property {
  static var propertyType: GType {
    return g_type_from_name("gfloat")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_float(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_float(value, self)
  }
}

extension CDouble: Property {
  static var propertyType: GType {
    return g_type_from_name("gdouble")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_double(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_double(value, self)
  }
}

extension String: Property {
  static var propertyType: GType {
    return g_type_from_name("gchararray")
  }
  init(from value: UnsafeMutablePointer<GValue>) {
    guard let string = g_value_get_string(value) else {
      self.init("")!
      return
    }
    self.init(cString: string)
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_string(value, isEmpty ? nil : self)
  }
}

extension UnsafeMutableRawPointer: Property {
  static var propertyType: GType {
    return g_type_from_name("GObject")
  }
  init?(from value: UnsafeMutablePointer<GValue>) {
    self.init(g_value_get_object(value))
  }
  func write(into value: UnsafeMutablePointer<GValue>) {
    g_value_set_object(value, self)
  }
}
