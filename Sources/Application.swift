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

public protocol ApplicationProtocol: ObjectProtocol {
  // Functions
  mutating func add(window: Window)
  mutating func remove(window: Window)
  mutating func run()
  mutating func hold()
  mutating func release()
  mutating func quit()
  func getWindow(id: UInt32) -> Window?
  
  // properties
  var prefersAppMenu: Bool { get }
  var activeWindow: Window { get }
  var windows: [Window] { get }
  var applicationId: String { get set }
  var inactivityTimeout: UInt32 { get set }
  var resourceBasePath: String { get set }
  var isRegistered: Bool { get }
  var isRemote: Bool { get }
  
  // signals
  var activated: ActivatedSignal { get }
  var windowAdded: WindowAddedSignal { get }
  var windowRemoved: WindowRemovedSignal { get }
}

public struct Application: Object, ApplicationProtocol {
  public let handle: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkApplication>) {
    handle = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  
  public init(id: String, flags: ApplicationFlags = .None) {
    self.init(gtk_application_new(id, flags.value))
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
public extension ApplicationProtocol {
  var application: UnsafeMutablePointer<GtkApplication> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkApplication>.self)
  }
  var gApplication: UnsafeMutablePointer<GApplication> {
    return unsafeBitCast(handle, to: UnsafeMutablePointer<GApplication>.self)
  }
  
  mutating func add(window: Window) {
    gtk_application_add_window(application, window.window)
  }
  mutating func remove(window: Window) {
    gtk_application_remove_window(application, window.window)
  }
  var windows: [Window] {
    return Array<Window>(from: gtk_application_get_windows(application))
  }
  func getWindow(id: UInt32) -> Window? {
    return Window(gtk_application_get_window_by_id(application, id))
  }
  var prefersAppMenu: Bool {
    return gtk_application_prefers_app_menu(application) != 0
  }
  var activeWindow: Window {
    return Window(gtk_application_get_active_window(application))
  }
  var activated: ActivatedSignal {
    return ActivatedSignal(instance: application)
  }
  var windowAdded: WindowAddedSignal {
    return WindowAddedSignal(instance: application)
  }
  var windowRemoved: WindowRemovedSignal {
    return WindowRemovedSignal(instance: application)
  }
  
  func run() {
    g_application_run(gApplication, CommandLine.argc, CommandLine.unsafeArgv)
    g_object_unref(gApplication)
  }
  func hold() {
    g_application_hold(gApplication)
  }
  func release() {
    g_application_release(gApplication)
  }
  func quit() {
    g_application_quit(gApplication)
  }
  var applicationId: String {
    get {
      return String(cString: g_application_get_application_id(gApplication))
    } set {
      g_application_set_application_id(gApplication, newValue)
    }
  }
  var inactivityTimeout: UInt32 {
    get {
      return g_application_get_inactivity_timeout(gApplication)
    } set {
      g_application_set_inactivity_timeout(gApplication, newValue)
    }
  }
  var resourceBasePath: String {
    get {
      return String(cString: g_application_get_resource_base_path(gApplication))
    } set {
      g_application_set_resource_base_path(gApplication, newValue)
    }
  }
  var isRegistered: Bool {
    return g_application_get_is_registered(gApplication) != 0
  }
  var isRemote: Bool {
    return g_application_get_is_remote(gApplication) != 0
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Signal classes
////////////////////////////////////////////////////////////////////////////////
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
