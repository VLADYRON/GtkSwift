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

public protocol WindowProtocol: BinProtocol {
  typealias Pointer = UnsafeMutablePointer<GtkWindow>
}
public struct Window: WindowProtocol, Object, Buildable {
  public var underlying: UnsafeMutablePointer<GtkWindow>
  
  init(_ ptr: UnsafeMutableRawPointer) {
    underlying = unsafeBitCast(ptr, to: Pointer.self)
  }
  public init(type: WindowType = .TopLevel) {
    self.init(gtk_window_new(type.value)!)
  }
  
  public static func enableDebugging(toggle: Bool) {
    gtk_window_set_interactive_debugging(toggle ? 1 : 0)
  }
}

public extension Object where Self: WindowProtocol {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Functions
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  public func activateFocus() -> Bool {
    return gtk_window_activate_focus(underlying) != 0
  }
  public func activateDefault() -> Bool {
    return gtk_window_activate_default(underlying) != 0
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Attributes
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  public var position: WindowPosition {
    get {
      return .None
    } set {
      gtk_window_set_position(underlying, newValue.value)
    }
  }
  public var typeHint: WindowTypeHint {
    get {
      return WindowTypeHint.make(value: gtk_window_get_type_hint(underlying))
    } set {
      gtk_window_set_type_hint(underlying, newValue.value)
    }
  }
  public var gravity: Gravity {
    get {
      return Gravity.make(value: gtk_window_get_gravity(underlying))
    } set {
      gtk_window_set_gravity(underlying, newValue.value)
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Appearance
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  public var title: String {
    get {
      return String(cString: gtk_window_get_title(underlying))
    } set {
      gtk_window_set_title(underlying, newValue)
    }
  }
  public var decorated: Bool {
    get {
      return gtk_window_get_decorated(underlying) != 0
    } set {
      gtk_window_set_decorated(underlying, newValue ? 1 : 0)
    }
  }
  public var hideTitlebarWhenMaximized: Bool {
    get {
      return gtk_window_get_hide_titlebar_when_maximized(underlying) != 0
    } set {
      gtk_window_set_hide_titlebar_when_maximized(underlying, newValue ? 1 : 0)
    }
  }
  public var defaultSize: (width:gint, height:gint) {
    get {
      var w: gint = 0
      var h: gint = 0
      gtk_window_get_default_size(underlying, &w, &h)
      return (w, h)
    } set {
      gtk_window_set_default_size(underlying, newValue.width, newValue.height)
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Flags
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  public var deletable: Bool {
    get {
      return gtk_window_get_deletable(underlying) != 0
    } set {
      gtk_window_set_deletable(underlying, newValue ? 1 : 0)
    }
  }
  public var destroyWithParent: Bool {
    get {
      return gtk_window_get_destroy_with_parent(underlying) != 0
    } set {
      gtk_window_set_destroy_with_parent(underlying, newValue ? 1 : 0)
    }
  }
  public var modal: Bool {
    get {
      return gtk_window_get_modal(underlying) != 0
    } set {
      gtk_window_set_modal(underlying, newValue ? 1 : 0)
    }
  }
  public var resizeable: Bool {
    get {
      return gtk_window_get_resizable(underlying) != 0
    } set {
      gtk_window_set_resizable(underlying, newValue ? 1 : 0)
    }
  }
  public var urgent: Bool {
    get {
      return gtk_window_get_urgency_hint(underlying) != 0
    } set {
      gtk_window_set_urgency_hint(underlying, newValue ? 1 : 0)
    }
  }
  public var skipTaskBar: Bool {
    get {
      return gtk_window_get_skip_taskbar_hint(underlying) != 0
    } set {
      gtk_window_set_skip_taskbar_hint(underlying, newValue ? 1 : 0)
    }
  }
  public var skipPager: Bool {
    get {
      return gtk_window_get_skip_pager_hint(underlying) != 0
    } set {
      gtk_window_set_skip_pager_hint(underlying, newValue ? 1 : 0)
    }
  }
  public var acceptFocus: Bool {
    get {
      return gtk_window_get_accept_focus(underlying) != 0
    } set {
      gtk_window_set_accept_focus(underlying, newValue ? 1 : 0)
    }
  }
  public var focusOnMap: Bool {
    get {
      return gtk_window_get_focus_on_map(underlying) != 0
    } set {
      gtk_window_set_focus_on_map(underlying, newValue ? 1 : 0)
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Signals
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  var activatedDefault: ActivateDefaultCallback {
    return ActivateDefaultCallback(instance: underlying)
  }
  var activatedFocus: ActivateFocusCallback {
    return ActivateFocusCallback(instance: underlying)
  }
  var debuggingEnabled: EnableDebuggingCallback {
    return EnableDebuggingCallback(instance: underlying)
  }
  var keysChanged: KeysChangedCallback {
    return KeysChangedCallback(instance: underlying)
  }
  var focusSet: SetFocusCallback {
    return SetFocusCallback(instance: underlying)
  }
}
