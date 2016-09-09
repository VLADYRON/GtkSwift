///
/// This file is part of GtkSwift. Copyright (C) 2016  Tim Diekmann
///
/// GtkSwift is free software: you can redistribute it and/or modify
/// it under the terms of the GNU Lesser General Public License as published
/// by the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// GtkSwift is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public License
/// along with GtkSwift. If not, see <http://www.gnu.org/licenses/>.
///

import CGtk

let handler: @convention(c) (UnsafeMutablePointer<CGtk.GtkApplication>, UnsafeMutableRawPointer) -> Void = { app, _ in
  let builder = gtk_builder_new_from_file("ui/builder.ui")
  let window = unsafeBitCast(gtk_builder_get_object(builder, "window"), to: UnsafeMutablePointer<CGtk.GtkWidget>.self)
  g_object_unref(builder)

  window.withMemoryRebound(to: GtkWindow.self, capacity: 1) {
    gtk_application_add_window(app, $0)
    gtk_window_set_title($0, "Window")
  }

  gtk_widget_show_all(window)
}

let app = gtk_application_new("GtkSwift.example", G_APPLICATION_FLAGS_NONE)
g_signal_connect_data(app, "activate", unsafeBitCast(handler, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
g_application_run(unsafeBitCast(app, to: UnsafeMutablePointer<CGtk.GApplication>.self), 0, nil)
g_object_unref(app)