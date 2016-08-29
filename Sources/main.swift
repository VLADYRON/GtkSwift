/* 
 * CGtk Copyright (C) 2016  Tim Diekmann
 * mailto: t.diekmann.3dv@gmail.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
    

import CGtk

let print_hello: @convention(c) (UnsafeMutablePointer<GtkWidget>, UnsafeMutableRawPointer) -> Void = { widget, data in
  print("Hello World!")
}

var widget: ApplicationWindow

typealias SignalCallbackOne = (UnsafeMutableRawPointer) -> Void
class Wrap {
    let callback: SignalCallbackOne
    
    init(callback: SignalCallbackOne) {
        self.callback = callback
    }
}

let handler: @convention(c) (UnsafeMutablePointer<GtkApplication>, UnsafeMutableRawPointer) -> Void = { app, user_data in
  let window: UnsafeMutablePointer<GtkWidget>
  let button: UnsafeMutablePointer<GtkWidget>
  let button_box: UnsafeMutablePointer<GtkWidget>
  
  widget = ApplicationWindow(application: app)
  print(widget.id)
  widget.title = "Hello World!"
  print(widget.title)
//   window.withMemoryRebound(to: GtkWindow.self, capacity: 1) {
//     gtk_window_set_title($0, "Window")
//     gtk_window_set_default_size($0, 200, 200)
//   }  
  
//   button_box = gtk_button_box_new (GTK_ORIENTATION_HORIZONTAL)
//   window.withMemoryRebound(to: GtkContainer.self, capacity: 1) {
//     gtk_container_add ($0, button_box);
//   }
  
//   button = gtk_button_new_with_label ("Hello World")
//   g_signal_connect_data(button, "clicked", unsafeBitCast(print_hello, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
  
//   let wrapper: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, data in
//     print(sender)
//     print(p1)
//     print(data)
//   }
//   typealias my_cb_t = (UnsafeMutableRawPointer) -> Void
//   let i = Wrap()
//   print(window)
//   print(button)
//   print(Unmanaged.passUnretained(i).toOpaque())
//   let ptr = UnsafeMutableRawPointer(Unmanaged.passUnretained(i).toOpaque())
//   g_signal_connect_data(button, "clicked", unsafeBitCast(wrapper, to: GCallback.self), UnsafeMutableRawPointer(ptr), nil, G_CONNECT_SWAPPED)
  
// #define g_signal_connect(instance, detailed_signal, c_handler, data) \
//     g_signal_connect_data ((instance), (detailed_signal), (c_handler), (data), NULL, (GConnectFlags) 0)
  
//   unsafeBitCast(box, to: Wrap.self)

//   typealias Wrapper = @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
//   let wrapper = unsafeBitCast(gtk_widget_destroy, to: Wrapper.self)
//   typealias CFunction = @convention(c) (UnsafeMutablePointer<Void>, Float) -> Int
//     let bar = unsafeBitCast(foo, CFunction.self)
//   g_signal_connect_data(button, "clicked", unsafeBitCast(gtk_widget_destroy, to: GCallback.self), nil, nil, G_CONNECT_SWAPPED);
  
  
  
//   button_box.withMemoryRebound(to: GtkContainer.self, capacity: 1) {
//     gtk_container_add ($0, button);
//   }
//   gtk_widget_show_all(window)
//   widget.handle = window
    widget.showAll()
}


func main(argc: Int, argv: [String]) -> Int32 {
  let app: UnsafeMutablePointer<GtkApplication>
  var status: Int32 = 0

  app = gtk_application_new("com.example.application", G_APPLICATION_FLAGS_NONE)
  
  g_signal_connect_data(app, "activate", unsafeBitCast(handler, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
  app.withMemoryRebound(to: GApplication.self, capacity: 1) {
    status = g_application_run($0, 0, nil);
  }
  g_object_unref(app)
  
  return status
}


exit(main(argc: CommandLine.arguments.count, argv: CommandLine.arguments))