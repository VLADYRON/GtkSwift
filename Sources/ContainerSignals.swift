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

public struct AddedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkContainer>
  var instance: Instance!
  private typealias Function = (Container, Widget) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWidget>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Container($0), Widget($1))
    }
    return connectSignal(object: instance, signal: "add", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct RemovedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkContainer>
  var instance: Instance!
  private typealias Function = (Container, Widget) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWidget>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Container($0), Widget($1))
    }
    return connectSignal(object: instance, signal: "remove", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct FocusedChildSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkContainer>
  var instance: Instance!
  private typealias Function = (Container, Widget) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeMutablePointer<GtkWidget>, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($2).takeUnretainedValue().function as! Function)(Container($0), Widget($1))
    }
    return connectSignal(object: instance, signal: "set-focus-child", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}

public struct CheckedResizeSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkContainer>
  var instance: Instance!
  private typealias Function = (Container) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Container($0))
    }
    return connectSignal(object: instance, signal: "check-resize", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}