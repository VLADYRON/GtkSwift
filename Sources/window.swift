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

public class Window: Widget {
    internal var windowHandle: UnsafeMutablePointer<GtkWindow>? {
        get {
            return UnsafeMutablePointer<GtkWindow>(OpaquePointer(handle))
        }
    }
    
    
    var title: String? {
        get {
            return String(cString: gtk_window_get_title(windowHandle))
        }
        set {
            gtk_window_set_title(windowHandle, newValue)
        }
    }
}