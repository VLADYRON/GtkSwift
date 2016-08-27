//
//  Copyright © 2016 Tim Diekmann. All rights reserved.
//

import CGtk

let print_hello: @convention(c) (UnsafeMutablePointer<GtkWidget>, UnsafeMutableRawPointer) -> Void = { widget, data in
  print("Hello World!")
}

let handler: @convention(c) (UnsafeMutablePointer<GtkApplication>, UnsafeMutableRawPointer) -> Void = { app, user_data in
  let window: UnsafeMutablePointer<GtkWidget>
  let button: UnsafeMutablePointer<GtkWidget>
  let button_box: UnsafeMutablePointer<GtkWidget>
  
  window = gtk_application_window_new(app)  
  window.withMemoryRebound(to: GtkWindow.self, capacity: 1) {
    gtk_window_set_title($0, "Window")
    gtk_window_set_default_size($0, 200, 200)
  }  
  
  button_box = gtk_button_box_new (GTK_ORIENTATION_HORIZONTAL)
  window.withMemoryRebound(to: GtkContainer.self, capacity: 1) {
    gtk_container_add ($0, button_box);
  }
  
  button = gtk_button_new_with_label ("Hello World")
  g_signal_connect_data(button, "clicked", unsafeBitCast(print_hello, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
  //g_signal_connect_data(button, "clicked", unsafeBitCast(gtk_widget_destroy, to: GCallback.self), nil, nil, G_CONNECT_SWAPPED);
  button_box.withMemoryRebound(to: GtkContainer.self, capacity: 1) {
    gtk_container_add ($0, button);
  }
  
  gtk_widget_show_all(window)
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