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


let app = Application(id: "projects.GtkSwift")
app.activated.connect {
	application in
	var window = ApplicationWindow(application: application)
	window.title = "Window"
	window.defaultSize = (width: 200, height: 200)
	window.debuggingEnabled.connect {
		_, toggle in
		Window.enableDebugging(toggle: toggle)
	}
	
	let buttonBox = ButtonBox()
	window.add(widget: buttonBox)
	
	var id: UInt = 0
	let button = Button(label: "Hello World!")
	id = button.clicked.connect {
		_ in
		print(application.isRemote)
		print(application.resourceBasePath)
	}
	buttonBox.add(widget: button)
	
	
	window.showAll()
////	gtk_button_clicked(button.button)
////	window.destroy()
}
app.run()
//

//gtk_init(nil, nil)
//
//let builder = Builder(fromFile: "ui/builder.ui")
//let window = builder.get(widget: "window")! as Window
//let window = builder["window"]! as Window
//let button = builder["button1"]! as Button
//button.clicked.connect { button in
//  print(button)
//}
//window.destroyed.connect { _ in
//  quitMain()
//}
//(builder["quit"]! as Button).clicked.connect { _ in
//  window.destroy()
//}
//print(button.name)
//window.showAll()
//
//window.debuggingEnabled.connect {
//  _, toggle in
//  Window.enableDebugging(toggle: toggle)
//}
//print(window.name)
//gtk_builder_connect_signals(builder.underlying, nil);
//main()