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

internal class SignalData {
	let function: Any
	init(_ function: Any) {
		self.function = function
	}
}

public struct Signal<Func, CFunc> {
	@discardableResult public func connect(swapped: Bool = false, to closure: Func) -> UInt {
		let data = Unmanaged.passRetained(SignalData(closure)).toOpaque()
		let destructor: @convention(c) (UnsafeRawPointer) -> Void = { data in
			let _ = Unmanaged<SignalData>.fromOpaque(data).takeRetainedValue()
		}
		let cDestructor = unsafeBitCast(destructor, to: GClosureNotify.self)
		return g_signal_connect_data(object, signal, cClosure, data, cDestructor, swapped ? G_CONNECT_SWAPPED : G_CONNECT_AFTER)
	}
	public func disconnect(from closure: UInt) {
		g_signal_handler_disconnect(object, closure)
	}
	
	internal init(object: Object, signal: String, cClosure: CFunc) {
		self.object = object.object
		self.signal = signal
		self.cClosure = unsafeBitCast(cClosure, to: GCallback.self)
	}
	
	private let object: UnsafeMutablePointer<GObject>
	private let signal: String
	private let cClosure: GCallback
}