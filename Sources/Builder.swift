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

public class Builder: Object {
	internal var builder: UnsafeMutablePointer<GtkBuilder> {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkBuilder>.self)
		}
	}

	public convenience init() {
		self.init(gtk_builder_new()!)
	}
	public convenience init(fromFile path: String) {
		self.init(gtk_builder_new_from_file(path)!)
	}
	public convenience init(fromResource path: String) {
		self.init(gtk_builder_new_from_resource(path)!)
	}
	public convenience init(fromString string: String) {
		self.init(gtk_builder_new_from_string(string, string.characters.count)!)
	}
	public subscript(object: String) -> Object? {
		get {
			return Object(gtk_builder_get_object(builder, object))
		}
	}
}