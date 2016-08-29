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

public enum ApplicationFlag {
	case None
}


let handler: @convention(c) (UnsafeMutableRawPointer, OpaquePointer) -> Void = { a, data in
	print("blablabla")
	print(a)
	let app = UnsafeMutablePointer<Application>(data)
}

public class Application {
	internal var application: UnsafeMutablePointer<GtkApplication>
	private var activate: ((Application) -> Void)? = nil
	
	private var gApplication: UnsafeMutablePointer<GApplication> {
		get {
			return UnsafeMutablePointer<GApplication>(OpaquePointer(application))
		}
	}
	
	public init(id: String, flags: ApplicationFlag = .None) {
		switch flags {
			case .None:
				application = gtk_application_new(id, G_APPLICATION_FLAGS_NONE)
		}
	}
	
	public func run(_ app: @escaping (Application) -> Void) {
		activate = app
		
		let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {_, app in 
			let app = unsafeBitCast(app, to: Application.self)
			app.activate!(app)
		}
		
		g_signal_connect_data(application, "activate", unsafeBitCast(handler, to: GCallback.self), Unmanaged.passUnretained(self).toOpaque(), nil, G_CONNECT_AFTER)
		g_application_run(gApplication, CommandLine.argc, CommandLine.unsafeArgv)
		g_object_unref(application)
	}
}
