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

public protocol ContainerProtocol: WidgetProtocol {
	typealias Pointer = UnsafeMutablePointer<GtkContainer>
}
public struct Container: ContainerProtocol, Object, Buildable {
	public var underlying: UnsafeMutablePointer<GtkContainer>
	
	init(_ ptr: UnsafeMutableRawPointer) {
		underlying = unsafeBitCast(ptr, to: Pointer.self)
	}
}

public extension Object where Self: ContainerProtocol {
	public func add(widget: Widget) {
		gtk_container_add(underlying, widget.underlying)
	}
	public func remove(widget: Widget) {
		gtk_container_remove(underlying, widget.underlying)
	}
	public func checkResize() {
		gtk_container_check_resize(underlying)
	}
	public var focusChild: Widget? {
		get {
			return Widget(gtk_container_get_focus_child(underlying))
		}
		set {
			gtk_container_set_focus_child(underlying, newValue?.underlying)
		}
	}
	public var borderWith: guint {
		get {
			return gtk_container_get_border_width(underlying)
		}
		set {
			gtk_container_set_border_width(underlying, newValue)
		}
	}
	
	
	var added: AddedSignal {
		return AddedSignal(instance: underlying)
	}
	var removed: RemovedSignal {
		return RemovedSignal(instance: underlying)
	}
	var focusedChild: FocusedChildSignal {
		return FocusedChildSignal(instance: underlying)
	}
	var checkedResize: CheckedResizeSignal {
		return CheckedResizeSignal(instance: underlying)
	}
}
