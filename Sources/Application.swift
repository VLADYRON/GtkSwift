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

public protocol GApplicationProtocol {
  typealias Pointer = UnsafeMutablePointer<GApplication>
}
public protocol ApplicationProtocol: GApplicationProtocol {
  typealias Pointer = UnsafeMutablePointer<GtkApplication>
}
public struct Application: ApplicationProtocol, Object {
  public var underlying: UnsafeMutablePointer<GtkApplication>
  
  init(_ ptr: UnsafeMutableRawPointer) {
    underlying = unsafeBitCast(ptr, to: Pointer.self)
  }
  public init(id: String, flags: ApplicationFlags = .None) {
    self.init(unsafeBitCast(gtk_application_new(id, flags.value), to: Pointer.self))
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Functions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public extension Object where Self: ApplicationProtocol {
  public func add(window: Window) {
    gtk_application_add_window(underlying, window.underlying)
  }
  public func remove(window: Window) {
    gtk_application_remove_window(underlying, window.underlying)
  }
  public var windows: [Window] {
    return Array<Window>(from: gtk_application_get_windows(underlying))
  }
  public func getWindow(id: UInt32) -> Window? {
    return Window(gtk_application_get_window_by_id(underlying, id))
  }
}
public extension Object where Self: GApplicationProtocol {
  public func run() {
    g_application_run(underlying, CommandLine.argc, CommandLine.unsafeArgv)
    g_object_unref(underlying)
  }
  public func hold() {
    g_application_hold(underlying)
  }
  public func release() {
    g_application_release(underlying)
  }
  public func quit() {
    g_application_quit(underlying)
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Properties
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public extension Object where Self: ApplicationProtocol {
  public var prefersAppMenu: Bool {
    return gtk_application_prefers_app_menu(underlying) != 0
  }
  var activeWindow: Window {
    return Window(gtk_application_get_active_window(underlying))
  }
}
public extension Object where Self: GApplicationProtocol {
  var applicationId: String {
    get {
      return String(cString: g_application_get_application_id(underlying))
    } set {
      g_application_set_application_id(underlying, newValue)
    }
  }
  var inactivityTimeout: UInt32 {
    get {
      return g_application_get_inactivity_timeout(underlying)
    } set {
      g_application_set_inactivity_timeout(underlying, newValue)
    }
  }
  var resourceBasePath: String {
    get {
      return String(cString: g_application_get_resource_base_path(underlying))
    } set {
      g_application_set_resource_base_path(underlying, newValue)
    }
  }
  var isRegistered: Bool {
    return g_application_get_is_registered(underlying) != 0
  }
  var isRemote: Bool {
    return g_application_get_is_remote(underlying) != 0
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Signals
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public extension Object where Self: ApplicationProtocol {
  var activated: ActivatedSignal {
    return ActivatedSignal(instance: underlying)
  }
  var windowAdded: WindowAddedSignal {
    return WindowAddedSignal(instance: underlying)
  }
  var windowRemoved: WindowRemovedSignal {
    return WindowRemovedSignal(instance: underlying)
  }
}
