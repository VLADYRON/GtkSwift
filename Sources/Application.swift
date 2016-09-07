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

public class Application: Object {
	internal var application: UnsafeMutablePointer<GtkApplication> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkApplication>.self)
		}
	}
 	internal var gApplication: UnsafeMutablePointer<GApplication> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GApplication>.self)
		}
	}
	public convenience init(id: String, flags: ApplicationFlags = .None) {
		self.init(gtk_application_new(id, flags.value())!)
	}
	
	public func add(window: Window) {
		gtk_application_add_window(application, window.window)
	}
	public func remove(window: Window) {
		gtk_application_remove_window(application, window.window)
	}
	public var windows: [Window] {get{
		return Array<Window>(from: gtk_application_get_windows(application))
	}}
	public func getWindow(id: UInt32) -> Window? {
		return Window(gtk_application_get_window_by_id(application, id))
	}
	
	public func run() {
		g_application_run(gApplication, CommandLine.argc, CommandLine.unsafeArgv)
		g_object_unref(application)
	}
	public var prefersAppMenu: Bool {get{
		return gtk_application_prefers_app_menu(application) != 0
	}}
	public func hold() {
		g_application_hold(gApplication)
	}
	public func release() {
		g_application_release(gApplication)
	}
	public func quit() {
		g_application_quit(gApplication)
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Properties
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	var applicationId: String {
		get {
			return String(cString: g_application_get_application_id(gApplication))
		} set {
			g_application_set_application_id(gApplication, newValue)
		}
	}
	var activeWindow: Window {
		get {
			return Window(gtk_application_get_active_window(application))
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
		get {
			return g_application_get_is_registered(gApplication) != 0
		}
	}
	var isRemote: Bool {
		get {
			return g_application_get_is_remote(gApplication) != 0
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public typealias Activated = (Application)->Void
	public lazy var activated: Signal<Activated,(@convention(c)(UnsafeMutablePointer<GtkApplication>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "activate", cClosure: { instance, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! Activated
		function(Application(instance))
	})
	
	public typealias WindowAdded = (Application, Window)->Void
	public lazy var windowAdded: Signal<WindowAdded,(@convention(c)(UnsafeMutablePointer<GtkApplication>, UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "window-added", cClosure: { instance, window, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! WindowAdded
		function(Application(instance), Window(window))
	})
	
	public typealias WindowRemoved = (Application, Window)->Void
	public lazy var windowRemoved: Signal<WindowRemoved,(@convention(c)(UnsafeMutablePointer<GtkApplication>, UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "window-removed", cClosure: { instance, window, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! WindowRemoved
		function(Application(instance), Window(window))
	})
}