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

public class Object {
	internal let object: UnsafeMutablePointer<GObject>
	internal convenience init?(_ object: UnsafeMutableRawPointer?) {
		guard let object = object else {
			return nil
		}
		self.init(object)
	}
	internal init(_ object: UnsafeMutableRawPointer) {
		self.object = unsafeBitCast(object, to: UnsafeMutablePointer<GObject>.self)
	}
	public func gTypeFromInstance() -> GType {
		let n_Instance = unsafeBitCast(object, to: UnsafePointer<GTypeInstance>.self).pointee
		let n_Class = unsafeBitCast(n_Instance.g_class, to: UnsafePointer<GTypeClass>.self)
		return n_Class.pointee.g_type
	}
}