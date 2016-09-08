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

public protocol ApplicationWindowProtocol: WindowProtocol, Buildable {
  var showMenuBar: Bool { get set }
  var id: guint { get }
}

public struct ApplicationWindow: Object, ApplicationWindowProtocol {
  public let underlyingPointer: UnsafeMutableRawPointer
  init(_ ptr: UnsafeMutablePointer<GtkApplicationWindow>) {
    underlyingPointer = unsafeBitCast(ptr, to: UnsafeMutableRawPointer.self)
  }
  public init(application: Application) {
    self.init(gtk_application_window_new(application.application))
  }
}

////////////////////////////////////////////////////////////////////////////////
/// Implementation
////////////////////////////////////////////////////////////////////////////////
extension ApplicationWindowProtocol {
  var applicationWindow: UnsafeMutablePointer<GtkApplicationWindow> {
    return unsafeBitCast(underlyingPointer, to: UnsafeMutablePointer<GtkApplicationWindow>.self)
  }
  
  public var showMenuBar: Bool {
    get {
      return gtk_application_window_get_show_menubar(applicationWindow) != 0
    } set {
      gtk_application_window_set_show_menubar(applicationWindow, newValue ? 1 : 0)
    }
  }
  public var id: guint {
    return gtk_application_window_get_id(applicationWindow)
  }
}
