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

protocol Class {
  var gClass: UnsafeMutablePointer<CGtk.GObjectClass> { get }
  var gParamSpecs: [UnsafeMutablePointer<CGtk.GParamSpec>] { get }
}

extension Class where Self: Handle {
  var gClass: UnsafeMutablePointer<CGtk.GObjectClass> {
    return g_object_get_class(gPointer)
  }
}

extension Class {
  var gParamSpecs: [UnsafeMutablePointer<CGtk.GParamSpec>] {
    var numberSpecs: guint = 0
    let paramSpecs = g_object_class_list_properties(gClass, &numberSpecs)
    let n: Int = numericCast(numberSpecs)
    defer {
      paramSpecs!.deallocate(capacity: n)
    }

    var array = [UnsafeMutablePointer<GParamSpec>]()
    array.reserveCapacity(n)
    for i in 0 ..< n {
      array.append(paramSpecs![i]!)
    }
    return array
  }
}
