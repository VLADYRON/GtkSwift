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

public class Window: Bin {
	internal var window: UnsafeMutablePointer<GtkWindow> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkWindow>.self)
		}
	}
	public convenience init(type: WindowType = .TopLevel) {
		self.init(gtk_window_new(type.value)!)
	}
	
	public static func enableDebugging(toggle: Bool) {
		gtk_window_set_interactive_debugging(toggle ? 1 : 0)
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Functions
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public func activateFocus() -> Bool {
		return gtk_window_activate_focus(window) != 0
	}
	public func activateDefault() -> Bool {
		return gtk_window_activate_default(window) != 0
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Attributes
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public var position: WindowPosition {
		get {
			return .None
		} set {
			gtk_window_set_position(window, newValue.value)
		}
	}
	public var typeHint: WindowTypeHint {
		get {
			return WindowTypeHint.make(value: gtk_window_get_type_hint(window))
		} set {
			gtk_window_set_type_hint(window, newValue.value)
		}
	}
	public var gravity: Gravity {
		get {
			return Gravity.make(value: gtk_window_get_gravity(window))
		} set {
			gtk_window_set_gravity(window, newValue.value)
		}
	}
		
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Appearance
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public var title: String {
		get {
			return String(cString: gtk_window_get_title(window))
		} set {
			gtk_window_set_title(window, newValue)
		}
	}
	public var decorated: Bool {
		get {
			return gtk_window_get_decorated(window) != 0
		} set {
			gtk_window_set_decorated(window, newValue ? 1 : 0)
		}
	}
	public var hideTitlebarWhenMaximized: Bool {
		get {
			return gtk_window_get_hide_titlebar_when_maximized(window) != 0
		} set {
			gtk_window_set_hide_titlebar_when_maximized(window, newValue ? 1 : 0)
		}
	}
	public var defaultSize: (width: gint, height: gint) {
		get {
			var w: gint = 0
			var h: gint = 0
			gtk_window_get_default_size(window, &w, &h)
			return (w, h)
		} set {
			gtk_window_set_default_size(window, newValue.width, newValue.height)
		}
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Flags
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public var deletable: Bool {
		get {
			return gtk_window_get_deletable(window) != 0
		} set {
			gtk_window_set_deletable(window, newValue ? 1 : 0)
		}
	}
	public var destroyWithParent: Bool {
		get {
			return gtk_window_get_destroy_with_parent(window) != 0
		} set {
			gtk_window_set_destroy_with_parent(window, newValue ? 1 : 0)
		}
	}
	public var modal: Bool {
		get {
			return gtk_window_get_modal(window) != 0
		} set {
			gtk_window_set_modal(window, newValue ? 1 : 0)
		}
	}
	public var resizeable: Bool {
		get {
			return gtk_window_get_resizable(window) != 0
		} set {
			gtk_window_set_resizable(window, newValue ? 1 : 0)
		}
	}
	public var urgent: Bool {
		get {
			return gtk_window_get_urgency_hint(window) != 0
		} set {
			gtk_window_set_urgency_hint(window, newValue ? 1 : 0)
		}
	}
	public var skipTaskBar: Bool {
		get {
			return gtk_window_get_skip_taskbar_hint(window) != 0
		} set {
			gtk_window_set_skip_taskbar_hint(window, newValue ? 1 : 0)
		}
	}
	public var skipPager: Bool {
		get {
			return gtk_window_get_skip_pager_hint(window) != 0
		} set {
			gtk_window_set_skip_pager_hint(window, newValue ? 1 : 0)
		}
	}
	public var acceptFocus: Bool {
		get {
			return gtk_window_get_accept_focus(window) != 0
		} set {
			gtk_window_set_accept_focus(window, newValue ? 1 : 0)
		}
	}
	public var focusOnMap: Bool {
		get {
			return gtk_window_get_focus_on_map(window) != 0
		} set {
			gtk_window_set_focus_on_map(window, newValue ? 1 : 0)
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/// Signals
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public typealias ActivateDefaultCallback = (Window)->Void
	public lazy var activatedDefault: Signal<ActivateDefaultCallback,(@convention(c)(UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "activate-default", cClosure: { instance, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! ActivateDefaultCallback
		function(Window(instance))
	})
	
	public typealias ActivateFocusCallback = (Window)->Void
	public lazy var activatedFocus: Signal<ActivateFocusCallback,(@convention(c)(UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "activate-focus", cClosure: { instance, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! ActivateFocusCallback
		function(Window(instance))
	})
	
	public typealias EnableDebuggingCallback = (Window, Bool)->Void
	public lazy var debuggingEnabled: Signal<EnableDebuggingCallback,(@convention(c)(UnsafeMutablePointer<GtkWindow>, gboolean, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "enable-debugging", cClosure: { instance, toggle, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! EnableDebuggingCallback
		function(Window(instance), toggle != 0)
	})
	
	public typealias KeysChangedCallback = (Window)->Void
	public lazy var keysChanged: Signal<KeysChangedCallback,(@convention(c)(UnsafeMutablePointer<GtkWindow>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "keys-changed", cClosure: { instance, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! KeysChangedCallback
		function(Window(instance))
	})
	
	public typealias SetFocusCallback = (Window, Widget)->Void
	public lazy var focusSet: Signal<SetFocusCallback,(@convention(c)(UnsafeMutablePointer<GtkWindow>, UnsafeMutablePointer<GtkWidget>, UnsafeRawPointer) -> Void)>
	= Signal(object: self, signal: "set-focus", cClosure: { instance, widget, data in
		let function = Unmanaged<SignalData>.fromOpaque(data).takeUnretainedValue().function as! SetFocusCallback
		function(Window(instance), Widget(widget))
	})
}


