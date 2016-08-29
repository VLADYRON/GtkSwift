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

// let print_hello: @convention(c) (UnsafeMutablePointer<GtkWidget>, UnsafeMutableRawPointer) -> Void = { widget, data in
// 	print("Hello World!")
// }

Application(id: "com.example.application").run{
	let widget = ApplicationWindow(application: $0)
	widget.title = "Hello World!"
	widget.defaultSize = (width: 200, height: 200)
	
	let buttonBox = ButtonBox()
	widget.add(widget: buttonBox)
	
	let button = Button(label: "Hello World!")
	buttonBox.add(widget: button)
	
	// g_signal_connect_data(button.widget, "clicked", unsafeBitCast(print_hello, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
	widget.showAll()
}
