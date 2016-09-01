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

public class Container: Widget{
	internal var container: UnsafeMutablePointer<GtkContainer>? {
		get {
			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkContainer>.self)
		}
	}
	internal override init?(object: UnsafeMutableRawPointer?) {
		super.init(object: object)

		connect(signal: "add") {[unowned self] widget in self.added?(self, Object.get(object: widget) as! Widget)}
		connect(signal: "remove") {[unowned self] widget in self.removed?(self, Object.get(object: widget) as! Widget)}
		connect(signal: "set-focus-child") {[unowned self] widget in self.focusedChild?(self, Object.get(object: widget) as? Widget)}
		connect(signal: "check-resize") {[unowned self] in self.checkedResize?(self)}
	}

	public func add(widget: Widget) {
		gtk_container_add(container, widget.widget)
	}
	public func remove(widget: Widget) {
		gtk_container_remove(container, widget.widget)
	}
	public func checkResize() {
		gtk_container_check_resize(container)
	}

	public var focusVAdjustment: Adjustment? {
		get {
			return Adjustment(object: gtk_container_get_focus_vadjustment(container))
		}
		set {
			gtk_container_set_focus_vadjustment(container, newValue?.adjustment)
		}
	}
	public var focusChild: Widget? {
		get {
			let containerP = gtk_container_get_focus_child(container)
			return Object.get(object: containerP) as? Widget
		}
		set {
			gtk_container_set_focus_child(container, newValue?.widget)
		}
	}

	public var added: ((Container, Widget) -> Void)?
	public var removed: ((Container, Widget) -> Void)?
	public var checkedResize: ((Container) -> Void)?
	public var focusedChild: ((Container, Widget?) -> Void)?
}
