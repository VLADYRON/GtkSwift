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

public protocol ButtonProtocol: ContainerProtocol, Buildable {
  // Functions
  func signalClicked()
  
  // Properties
  var reliefStyle: ReliefStyle { get set }
  var label: String { get set }
  var useUnderline: Bool { get set }
  var image: WidgetProtocol? { get set }
  
  // Signals
  var clicked: ClickedSignal { get }
}

public struct Button: Object, ButtonProtocol {
  public let underlyingPointer: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkButton>) {
    underlyingPointer = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  public init() {
    self.init(gtk_button_new())
  }
  public init(label: String, mnemonic: Bool = false) {
    switch mnemonic {
    case true: self.init(gtk_button_new_with_mnemonic(label))
    case false: self.init(gtk_button_new_with_label(label))
    }
  }
  public init(icon: String, size: IconSize = .Button) {
    self.init(gtk_button_new_from_icon_name(icon, size.value))
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension ButtonProtocol {
  var button: UnsafeMutablePointer<GtkButton> {
    return unsafeBitCast(underlyingPointer, to: UnsafeMutablePointer<GtkButton>.self)
  }
  public var reliefStyle: ReliefStyle {
    get {
      return ReliefStyle.make(value: gtk_button_get_relief(button))
    } set {
      gtk_button_set_relief(button, newValue.value)
    }
  }
  public var label: String {
    get {
      return String(cString: gtk_button_get_label(button))
    } set {
      gtk_button_set_label(button, newValue.isEmpty ? nil : newValue)
    }
  }
  public var useUnderline: Bool {
    get {
      return gtk_button_get_use_underline(button) != 0
    } set {
      gtk_button_set_use_underline(button, newValue ? 1 : 0)
    }
  }
  public var image: WidgetProtocol? {
    get {
      return Widget(gtk_button_get_image(button))
    } set {
      gtk_button_set_image(button, newValue == nil ? nil : newValue!.widget)
    }
  }
  public func signalClicked() {
    gtk_button_clicked(button)
  }
  public var clicked: ClickedSignal {
    return ClickedSignal(instance: button)
  }
}

public struct ClickedSignal: Signal {
  typealias Instance = UnsafeMutablePointer<GtkButton>
  var instance: Instance!
  private typealias Function = (Button) -> Void
  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(Button($0))
    }
    return connectSignal(object: instance, signal: "clicked", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
  }
}
