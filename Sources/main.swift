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


//import CGtk



//let app = Application(id: "projects.GtkSwift")
//app.activated.connect{ application in
//	let window = ApplicationWindow(application: application)
//	window.title = "Window"
//	window.defaultSize = (width: 200, height: 200)
//	window.debuggingEnabled.connect {_, toggle in
//		Window.enableDebugging(toggle: toggle)
//	}
//
//	let buttonBox = ButtonBox()
//	window.add(widget: buttonBox)
//
//	var id: UInt = 0
//	let button = Button(label: "Hello World!")
////	id = button.clicked.connect {_ in
////		print(application.isRemote)
////		print(application.resourceBasePath)
////	}
//	buttonBox.add(widget: button)
//
//
//	window.showAll()
////	gtk_button_clicked(button.button)
////	window.destroy()
//}
//app.run()

let builder = Builder(fromFile: "ui/help.ui")
main()
//
//
////	internal var builder: UnsafeMutablePointer<GtkBuilder> {
////		get {
////			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkBuilder>.self)
////		}
////	}
////
////	public init() {
////		super.init(object: gtk_builder_new())
////	}
////	public init(fromFile path: String) {
////		super.init(object: gtk_builder_new_from_file(path))
////	}
////	public init(fromResource path: String) {
////		super.init(object: gtk_builder_new_from_resource(path))
////	}
////	public init(fromString string: String) {
////		super.init(object: gtk_builder_new_from_string(string, string.characters.count))
////	}
////	public subscript(object: String) -> Object? {
////		get {
////			return Object(object: gtk_builder_get_object(builder, object))
////		}
////	}
//
////
//Application(id: "com.example.application").run { application in
////	let builder = Builder(fromFile: "ui/builder.ui")
////	let window = Window(object: builder["window"]!)
////	window.destroyed = {_ in quitMain(); print("destroyed")}
////
////	for object in builder.objects {
////		print(object.title)
////	}
////
////	main()
////	print(application.activeWindow?.title)
//	let window = ApplicationWindow(application: application)
//	window.title = "Window"
//	window.borderWith = 10
//
//	let grid = Grid()
//	window.add(widget: grid)
//
//	var button = Button(label: "Button 1")
//	button.clicked = {_ in print("Hello World") }
//	grid.attach(widget: button, left: 0, top: 0)
//
//	button = Button(label: "Button 2")
//	button.clicked = {_ in print("Hello World") }
//	grid.attach(widget: button, left: 1, top: 0)
//
//	button = Button(label: "Button 2")
//	button.clicked = {_ in print("Hello World") }
//	grid.attach(widget: button, left: 1, top: 0)
//
//	button = Button(label: "Quit")
//	button.clicked = { _ in window.destroy() }
//	grid.attach(widget: button, left: 0, top: 1, width: 2)
//
//	window.showAll()
//
//	for window in application.windows {
//		print(window.title)
//	}
//	print(application.prefersAppMenu)
//
//	let obj = Object(object: gtk_builder_new())
//
//
//}
