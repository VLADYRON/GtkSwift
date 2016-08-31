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

Application(id: "com.example.application")?.run {
	guard let widget = ApplicationWindow(application: $0) else { exit(1) }

	widget.title = "Hello World!"
	widget.defaultSize = (width: 200, height: 200)

	guard let buttonBox = ButtonBox() else { exit(2) }
	widget.add(widget: buttonBox)

	guard let button = Button(label: "Hello World!") else { exit(3) }
	buttonBox.add(widget: button)

	button.clicked = { button in
		print(button)
		print("hello world!")
	}
	print(widget.defaultSize)
	widget.showAll()
	var adj = widget.focusVAdjustment
	let a = Adjustment(value: 2, lower: 3, upper: 10, stepIncrement: 1, pageIncrement: 2, pageSize: 1)
	adj = a
	a.changed = { (adjustment: Adjustment) in
		print(adjustment)
	}
	// widget.added = {
	// 	print($0, $1)
	// }

	// widget.focusChild = nil
}
