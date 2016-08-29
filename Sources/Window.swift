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

public class Window: Bin {
  private var window: UnsafeMutablePointer<GtkWindow>? {
    get {
      return UnsafeMutablePointer<GtkWindow>(OpaquePointer(widget))
    }
  }
    
    
  var title: String {
    get {
      return String(cString: gtk_window_get_title(window))
    }
    set {
      gtk_window_set_title(window, newValue)
    }
  }
  
  var resizeable: Bool {
    get {
      return gtk_window_get_resizable(window) != 0
    }
    set {
      gtk_window_set_resizable(window, newValue ? 1 : 0)
    }
  }
  
  var defaultSize: (width: Int32, height: Int32) {
    get {
      let w: UnsafeMutablePointer<Int32>? = nil
      let h: UnsafeMutablePointer<Int32>? = nil
      gtk_window_get_default_size(window, w, h)
      guard w != nil && h != nil else {
        return (0, 0)
      }
      return (w![0], h![0])
    }
    set {
      gtk_window_set_default_size(window, newValue.width, newValue.height)
    }
    
  }
}