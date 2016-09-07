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


public class Widget: Object {
	internal var widget: UnsafeMutablePointer<GtkWidget> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkWidget>.self)
		}
	}
//	internal override init(object: UnsafeMutableRawPointer?) {
//		super.init(object: object)
//
//		connect(signal: "destroy") {[unowned self] in self.destroyed?(self)}
//	}

	public func showAll() {
		gtk_widget_show_all(widget)
	}

	public func destroy() {
		gtk_widget_destroy(widget)
	}

//	public var destroyed: ((Widget) -> Void)? = nil

}
