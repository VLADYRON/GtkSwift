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

Application(id: "com.example.application").run {
	let window = ApplicationWindow(application: $0)
	window.title = "Window"
	window.borderWith = 10
	
	let grid = Grid()
	window.add(widget: grid)
	
	var button = Button(label: "Button 1")
	button.clicked = {_ in print("Hello World") }
	grid.attach(widget: button, left: 0, top: 0)
	
	button = Button(label: "Button 2")
	button.clicked = {_ in print("Hello World") }
	grid.attach(widget: button, left: 1, top: 0)
	
	button = Button(label: "Button 2")
	button.clicked = {_ in print("Hello World") }
	grid.attach(widget: button, left: 1, top: 0)
	
	button = Button(label: "Quit")
	button.clicked = { _ in window.destroy() }
	grid.attach(widget: button, left: 0, top: 1, width: 2)
	
	window.showAll()
}
