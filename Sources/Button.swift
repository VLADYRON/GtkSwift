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

public class Button: Bin{
	private var button: UnsafeMutablePointer<GtkButton>? {
		get {
			return UnsafeMutablePointer<GtkButton>(OpaquePointer(widget))
		}
	}
	deinit {
		// TODO: delete
		print("deinit")
	}

	private typealias ClickedCallback = (Button) -> Void


	override public init() {
		print("init")
		super.init()
		widget = gtk_button_new()
		// FIXME: add [unowned self], results in Segmentation fault
		addSignal(name: "clicked"){self.clicked?(self)}
	}

	public init(label: String) {
		print("init")
		super.init()
		widget = gtk_button_new_with_label(label)
		// FIXME: add [unowned self], results in Segmentation fault
		addSignal(name: "clicked"){self.clicked?(self)}
	}

	public var clicked: ((Button) -> Void)? = nil
}
