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

public enum Orientation {
	case Horizontal
	case Vertical
}

public class ButtonBox: Box {
	private var buttonBox: UnsafeMutablePointer<GtkButtonBox>? {
		get {
			return UnsafeMutablePointer<GtkButtonBox>(OpaquePointer(widget))
		}
	}

	public init(orientation: Orientation = .Horizontal) {
		super.init()
		switch orientation {
			case .Horizontal:
				widget = gtk_button_box_new(GTK_ORIENTATION_HORIZONTAL)
			case .Vertical:
				widget = gtk_button_box_new(GTK_ORIENTATION_VERTICAL)
		}
	}
}
