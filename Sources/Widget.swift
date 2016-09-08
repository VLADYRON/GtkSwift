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

public protocol WidgetProtocol: ObjectProtocol, Buildable {
  func showAll()
  func destroy()
  var destroyed: DestroyedSignal { get }
}

public struct Widget: Object, WidgetProtocol {
  public let handle: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkWidget>) {
    handle = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension WidgetProtocol {
  var widget: UnsafeMutablePointer<GtkWidget> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkWidget>.self)
  }
  
  public func showAll() {
    gtk_widget_show_all(widget)
  }
  
  public func destroy() {
    gtk_widget_destroy(widget)
  }
  
  public var destroyed: DestroyedSignal {
    return DestroyedSignal(instance: widget)
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Signal classes
////////////////////////////////////////////////////////////////////////////////
public struct DestroyedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkWidget>
  var instance: Instance!
  private typealias Function = (Widget) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Widget($0))
    }
    return connectSignal(object: instance, signal: "destroy", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}
