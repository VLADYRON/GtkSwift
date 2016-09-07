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

public protocol ButtonProtocol: WidgetProtocol {
  typealias Pointer = UnsafeMutablePointer<GtkButton>
}
public struct Button: ButtonProtocol, Object, Buildable {
  public var underlying: UnsafeMutablePointer<GtkButton>
  
  init(_ ptr: UnsafeMutableRawPointer) {
    underlying = unsafeBitCast(ptr, to: Pointer.self)
  }
  public init(label: String) {
    self.init(unsafeBitCast(gtk_button_new_with_label(label), to: Pointer.self))
  }
}

public extension Object where Self: ButtonProtocol {
  var clicked: ClickedSignal {
    return ClickedSignal(instance: underlying)
  }
}
