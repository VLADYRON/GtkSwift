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

public struct ActivatedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkApplication>
  var instance: Instance!
  private typealias Function = (Application) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Application($0))
    }
    return connectSignal(object: instance, signal: "activate", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct WindowAddedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkApplication>
  var instance: Instance!
  private typealias Function = (Application, Window) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Application($0), Window($1))
    }
    return connectSignal(object: instance, signal: "window-added", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct WindowRemovedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkApplication>
  var instance: Instance!
  private typealias Function = (Application, Window) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Application($0), Window($1))
    }
    return connectSignal(object: instance, signal: "window-removed", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}
