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

public struct ActivateDefaultCallback: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWindow>
  var instance: Instance!
  private typealias Function = (Window) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Window($0))
    }
    return connectSignal(object: instance, signal: "activate-default", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct ActivateFocusCallback: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWindow>
  var instance: Instance!
  private typealias Function = (Window) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Window($0))
    }
    return connectSignal(object: instance, signal: "activate-focus", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct EnableDebuggingCallback: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWindow>
  var instance: Instance!
  private typealias Function = (Window, Bool) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, gboolean, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Window($0), $1 != 0)
    }
    return connectSignal(object: instance, signal: "enable-debugging", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct KeysChangedCallback: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWindow>
  var instance: Instance!
  private typealias Function = (Window) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Window($0))
    }
    return connectSignal(object: instance, signal: "keys-changed", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct SetFocusCallback: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWindow>
  var instance: Instance!
  private typealias Function = (Window, Widget) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWidget>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Window($0), Widget($1))
    }
    return connectSignal(object: instance, signal: "set-focus", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}