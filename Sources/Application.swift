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

public class Application: Object {
	internal var application: UnsafeMutablePointer<GtkApplication> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkApplication>.self)
		}
	}
 	internal var gApplication: UnsafeMutablePointer<GApplication> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GApplication>.self)
		}
	}

	public convenience init(id: String, flags: ApplicationFlags = .None) {
		self.init(object: gtk_application_new(id, flags.value()))
	}

	public func run(_ activate: @escaping (Application) -> Void) {
		connect(signal: "activate") { [unowned self] in activate(self)}
		g_application_run(gApplication, CommandLine.argc, CommandLine.unsafeArgv)
		g_object_unref(application)
	}
}
