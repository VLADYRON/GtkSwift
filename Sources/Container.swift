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
			return UnsafeMutablePointer<GtkContainer>(OpaquePointer(ptr))
		}
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
			guard let ptr = gtk_container_get_focus_vadjustment(container) else {
				return nil
			}
			return Adjustment(adjustment: ptr)
		}
		set {
			gtk_container_set_focus_vadjustment(container, newValue?.adjustment)
		}
	}
	public var focusChild: Widget? {
		get {
			guard let containerP = gtk_container_get_focus_child(container) else {
				return nil
			}
			return Widget.storage[UnsafeMutablePointer<GtkWidget>(OpaquePointer(containerP))]
		}
		set {
			gtk_container_set_focus_child(container, newValue?.widget)
		}
	}

	private var addedId: gulong?
	public var added: ((Container, Widget) -> Void)? {
		didSet {
			if added != nil {
				addedId = addSignal(name: "add") { [unowned self] (widget: UnsafeMutableRawPointer) in
					let widget = Widget.storage[UnsafeMutablePointer<GtkWidget>(OpaquePointer(widget))]
					assert(widget != nil, "Widget must not be null, Contact library creator please!")
					self.added?(self,widget!)
				}
			} else {
				removeSignal(id: addedId!)
				addedId = nil
			}
		}
	}
	private var checkedResizeId: gulong?
	public var checkedResize: ((Container) -> Void)? {
		didSet {
			if checkedResize != nil {
				checkedResizeId = addSignal(name: "check-resize") { [unowned self] in self.checkedResize?(self) }
			} else {
				removeSignal(id: checkedResizeId!)
				checkedResizeId = nil
			}
		}
	}
	private var removedId: gulong?
	public var removed: ((Container, Widget) -> Void)? {
		didSet {
			if removed != nil {
				removedId = addSignal(name: "remove") { [unowned self] (widget: UnsafeMutableRawPointer) in
					let widget = Widget.storage[UnsafeMutablePointer<GtkWidget>(OpaquePointer(widget))]
					assert(widget != nil, "Widget must not be null, Contact library creator please!")
					self.removed?(self,widget!)
				}
			} else {
				removeSignal(id: removedId!)
				removedId = nil
			}
		}
	}
	private var focusedChildId: gulong?
	public var focusedChild: ((Container, Widget?) -> Void)? {
		didSet {
			if focusedChild != nil {
				focusedChildId = addSignal(name: "set-focus-child") { [unowned self] (widget: UnsafeMutableRawPointer?) in
					guard let widget = widget else {
						self.focusedChild?(self,nil)
						return
					}
					self.focusedChild?(self,Widget.storage[UnsafeMutablePointer<GtkWidget>(OpaquePointer(widget))])
				}
			} else {
				removeSignal(id: focusedChildId!)
				focusedChildId = nil
			}
		}
	}
}
