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

typealias Callback = () -> Void
class SignalData {
	var callback: Callback
	init(callback: @escaping Callback) {
		self.callback = callback
	}
}

public class Widget {
	public var widget: UnsafeMutablePointer<GtkWidget>?
	private var signals: [String: (UInt, Any)] = [:]

	init() {
		widget = nil
	}
	init(application: Application) {
		widget = gtk_application_window_new(application.application)
	}
	internal init(_ ptr: UnsafeMutablePointer<GtkWidget>) {
		widget = ptr
	}

	func showAll() {
		gtk_widget_show_all(widget!)
	}

	public typealias ButtonClickedNative = @convention(c)(UnsafeMutablePointer<GtkButton>, gpointer) -> Void

	func addSignal(name: String, callback: @escaping Callback) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($1, to: SignalData.self)
			signalData.callback()
		}

		let data = SignalData(callback: callback)
		let id = g_signal_connect_data(widget, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), nil, G_CONNECT_AFTER)
		signals[name] = (id, data)
	}
}
