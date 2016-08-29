/* 
 * CGtk Copyright (C) 2016  Tim Diekmann
 * mailto: t.diekmann.3dv@gmail.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
    

import CGtk

public class ApplicationWindow: Window {    
    internal var applicationWindowHandle: UnsafeMutablePointer<GtkApplicationWindow>? {
        get {
            return UnsafeMutablePointer<GtkApplicationWindow>(OpaquePointer(handle))
        }
    }

    public init(application: UnsafeMutablePointer<GtkApplication>) {
        super.init()
        handle = gtk_application_window_new(application)
    }
    
    var showMenubar: Bool {
        get {
            return gtk_application_window_get_show_menubar(applicationWindowHandle) != 0
        }
        set {
            gtk_application_window_set_show_menubar(applicationWindowHandle, newValue ? 1 : 0)
        }
    }
    
    var id: UInt32 {
        get {
            return gtk_application_window_get_id(applicationWindowHandle)
        }
    }


}