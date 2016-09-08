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

public protocol ButtonBoxProtocol: ContainerProtocol, Buildable {
}

public struct ButtonBox: Object, ButtonBoxProtocol {
  public let handle: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkButtonBox>) {
    handle = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  public init(orientation: Orientation = .Horizontal) {
    self.init(gtk_button_box_new(orientation.value))
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension ButtonBoxProtocol {
  var buttonBox: UnsafeMutablePointer<GtkButtonBox> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkButtonBox>.self)
  }
}
