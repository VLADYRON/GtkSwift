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

internal class Data {
  let function: Any
  init(_ function: Any) {
    self.function = function
  }
}

internal func connectSignal(object: UnsafeMutableRawPointer, signal: String, swapped: Bool = false, to function: Any, _ callback: @escaping GCallback) -> UInt {
  let data = Unmanaged.passRetained(Data(function)).toOpaque()
  let destructor: @convention(c) (UnsafeRawPointer) -> Void = {
    data in
    let _ = Unmanaged<Data>.fromOpaque(data).takeRetainedValue()
  }
  let cDestructor = unsafeBitCast(destructor, to: GClosureNotify.self)
  return g_signal_connect_data(object, signal, callback, data, cDestructor, swapped ? G_CONNECT_SWAPPED : G_CONNECT_AFTER)
}

protocol Signal {
  associatedtype Instance
  var instance: Instance! { get set }
  init()
}

extension Signal {
  init(_ instance: Instance) {
    self.init()
    self.instance = instance
  }
  
  public func disconnect(from id: UInt) {
    g_signal_handler_disconnect(instance as! gpointer!, id)
  }
}
