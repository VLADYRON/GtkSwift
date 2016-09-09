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


let handler: @convention(c) (UnsafeMutablePointer<GtkApplication>, UnsafeMutableRawPointer) -> Void = {
  app, user_data in
  let window: UnsafeMutablePointer<GtkWidget>
  let button: UnsafeMutablePointer<GtkWidget>
  let button_box: UnsafeMutablePointer<GtkWidget>
  
  window = gtk_application_window_new(app)
  window.withMemoryRebound(to: GtkWindow.self, capacity: 1) {
    gtk_window_set_title($0, "Window")
    gtk_window_set_default_size($0, 200, 200)
  }
  print("teste")

//  gtk_window_set_decorated(unsafeBitCast(window, to: UnsafeMutablePointer<GtkWindow>.self), 0)
//  let w = Widget(ptr: window)!
//  w.showAll()
//  print(w.get(property: "events")! as Int32)
//  w.events = [.buttonPress, .keyPress]
//  print(w.events)
//  print(w.getType(property: "events") as [EventMask])
//  gtk_widget_destroy(window)
//  w.showAll()
  gtk_widget_show_all(window)
}

let app = gtk_application_new("com.example.application", G_APPLICATION_FLAGS_NONE)

g_signal_connect_data(app, "activate", unsafeBitCast(handler, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
g_application_run(unsafeBitCast(app, to: UnsafeMutablePointer<GApplication>.self), 0, nil);
g_object_unref(app)