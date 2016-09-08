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

public protocol WindowProtocol: BinProtocol, Buildable {
  // Functions
  @discardableResult mutating func activateFocus() -> Bool
  @discardableResult mutating func activateDefault() -> Bool
// Attributes
  var position: WindowPosition { get set }
  var typeHint: WindowTypeHint { get set }
  var gravity: Gravity { get set }
  
  // Appearance
  var title: String { get set }
  var decorated: Bool { get set }
  var hideTitlebarWhenMaximized: Bool { get set }
  var defaultSize: (width:Int32, height:Int32) { get set }
  
  // Flags
  var deletable: Bool { get set }
  var destroyWithParent: Bool { get set }
  var modal: Bool { get set }
  var resizeable: Bool { get set }
  var urgent: Bool { get set }
  var skipTaskBar: Bool { get set }
  var skipPager: Bool { get set }
  var acceptFocus: Bool { get set }
  var focusOnMap: Bool { get set }
  
  // Signals
  var activatedDefault: ActivateDefaultCallback { get }
  var activatedFocus: ActivateFocusCallback { get }
  var debuggingEnabled: EnableDebuggingCallback { get }
  var keysChanged: KeysChangedCallback { get }
  var focusSet: SetFocusCallback { get }
}

public struct Window: Object, WindowProtocol {
  public let underlyingPointer: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkWindow>) {
    underlyingPointer = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  
  public init(type: WindowType = .TopLevel) {
    self.init(gtk_window_new(type.value)!)
  }
}


////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension WindowProtocol {
  public var window: UnsafeMutablePointer<GtkWindow> {
    return unsafeBitCast(underlyingPointer, to: UnsafeMutablePointer<GtkWindow>.self)
  }
  
  @discardableResult public mutating func activateFocus() -> Bool {
    return gtk_window_activate_focus(window) != 0
  }
  @discardableResult public mutating func activateDefault() -> Bool {
    return gtk_window_activate_default(window) != 0
  }
  
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
  public var defaultSize: (width:gint, height:gint) {
    get {
      var w: gint = 0
      var h: gint = 0
      gtk_window_get_default_size(window, &w, &h)
      return (w, h)
    } set {
      gtk_window_set_default_size(window, newValue.width, newValue.height)
    }
  }
  
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
  
  public var activatedDefault: ActivateDefaultCallback {
    return ActivateDefaultCallback(instance: window)
  }
  public var activatedFocus: ActivateFocusCallback {
    return ActivateFocusCallback(instance: window)
  }
  public var debuggingEnabled: EnableDebuggingCallback {
    return EnableDebuggingCallback(instance: window)
  }
  public var keysChanged: KeysChangedCallback {
    return KeysChangedCallback(instance: window)
  }
  public var focusSet: SetFocusCallback {
    return SetFocusCallback(instance: window)
  }
}

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


extension Array where Element: WindowProtocol {
  init(from list: UnsafeMutablePointer<GList>?) {
    var list = list
    self.init()
    var element: GList
    while (list != nil) {
      element = list!.pointee
      append(Window(element.data) as! Element)
      list = element.next
    }
  }
}
