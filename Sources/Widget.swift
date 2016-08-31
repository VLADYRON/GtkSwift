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


public class Widget: Signalable {
	internal var widget: UnsafeMutablePointer<GtkWidget>

	internal var ptr: UnsafeMutableRawPointer {
		get {
			return UnsafeMutableRawPointer(OpaquePointer(widget))
		}
	}
	internal static var storage: [UnsafeMutablePointer<GtkWidget>: Widget] = [:]
	internal init(ptr: UnsafeMutableRawPointer) {
		widget = UnsafeMutablePointer<GtkWidget>(OpaquePointer(ptr))
		Widget.storage[widget] = self
		addSignal(name: "destroy") {[unowned self] in
			self.destroy?(self)
			Widget.storage.removeValue(forKey: self.widget)
		}
	}

	public func showAll() {
		gtk_widget_show_all(widget)
	}

	public var destroy: ((Widget) -> Void)? = nil
}
