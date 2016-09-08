/*
 * GtkSwift Copyright (C) 2016 Tim Diekmann
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

var bool = false
var w: WidgetProtocol? = nil
let app = Application(id: "projects.GtkSwift")
app.activated.connect {
  application in
  var window = ApplicationWindow(application: application)
  window.title = "Window"
  window.defaultSize = (width: 200, height: 200)
  window.debuggingEnabled.connect {
    _, toggle in
    enableDebugging(toggle: toggle)
  }
  
  var buttonBox = ButtonBox()
  window.add(widget: buttonBox)
  
  var id: UInt = 0
  var button = Button(icon: "Quit")
  
  w = button.image
  id = button.clicked.connect {
    button in
    var button: Button = button
    switch bool {
    case true:
      bool = false
      button.image = nil
    case false: bool = true
      button.useUnderline = true
      button.image = Button()
    }
    print(bool)
  }
  buttonBox.add(widget: button)
  buttonBox.focusChild = button
  
  
  window.showAll()

//  button.clicked()
//	gtk_button_clicked(button.button)
//	window.destroy()
}
app.run()
//

//
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






//public struct Container: ObjectHandle, ContainerProtocol {
//  public typealias Handle = UnsafeMutablePointer<GtkContainer>
//  public let handle: Handle
//  public init(_ handle: Handle) { self.handle = handle }
//
//  public init(label: String) {
//    self.init(unsafeBitCast(gtk_button_new_with_label(label), to: UnsafeMutablePointer<GtkButton>.self))
//  }
//}

//gtk_init(nil, nil)
//let builder = Builder(fromFile: "ui/builder.ui")
//let window = builder["window"]! as Window
//let button = builder["quit"]! as Button
//var id: UInt = 0
//id = button.clicked.connect {
//  button in
//  print(button)
//  let clickedSignal = button.clicked
//  clickedSignal.disconnect(from: id)
//  clickedSignal.connect {
//    _ in quitMain()
//  }
//}
//window.focusChild = window.child
//window.activateFocus()
//builder.connectSignals()
//main()

