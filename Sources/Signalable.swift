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


protocol Signalable {
	var ptr: UnsafeMutableRawPointer { get }
}
internal var signals: [gulong: AnyObject] = [:]

typealias CallbackZero = () -> Void
class SignalDataZero {
	let callback: CallbackZero
	var id: gulong?
	init(callback: @escaping CallbackZero) { self.callback = callback }
}

typealias CallbackOne = (UnsafeMutableRawPointer) -> Void
class SignalDataOne {
	let callback: CallbackOne
	var id: gulong?
	init(callback: @escaping CallbackOne) { self.callback = callback }
}

typealias CallbackTwo = (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
class SignalDataTwo {
	let callback: CallbackTwo
	var id: gulong?
	init(callback: @escaping CallbackTwo) { self.callback = callback }
}

typealias CallbackThree = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
class SignalDataThree {
	let callback: CallbackThree
	var id: gulong?
	init(callback: @escaping CallbackThree) { self.callback = callback }
}

typealias CallbackFour = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
class SignalDataFour {
	let callback: CallbackFour
	var id: gulong?
	init(callback: @escaping CallbackFour) { self.callback = callback }
}

typealias CallbackFive = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
class SignalDataFive {
	let callback: CallbackFive
	var id: gulong?
	init(callback: @escaping CallbackFive) { self.callback = callback }
}

extension Signalable {
	internal func removeSignal(id: gulong) {
		g_signal_handler_disconnect(ptr, id)
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackZero) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($1, to: SignalDataZero.self)
			signalData.callback()
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataZero.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataZero(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackOne) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($2, to: SignalDataOne.self)
			signalData.callback($1)
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataOne.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataOne(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackTwo) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($3, to: SignalDataTwo.self)
			signalData.callback($1, $2)
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataTwo.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataTwo(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackThree) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($4, to: SignalDataThree.self)
			signalData.callback($1, $2, $3)
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataThree.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataThree(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackFour) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($5, to: SignalDataFour.self)
			signalData.callback($1, $2, $3, $4)
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataFour.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataFour(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

	@discardableResult internal func addSignal(name: String, callback: @escaping CallbackFive) -> gulong {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			let signalData = unsafeBitCast($6, to: SignalDataFive.self)
			signalData.callback($1, $2, $3, $4, $5)
		}
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {data, _ in
			let signalData = unsafeBitCast(data, to: SignalDataFive.self)
			signals.removeValue(forKey: signalData.id!)
		}

		let data = SignalDataFive(callback: callback)
		let id = g_signal_connect_data(ptr, name, unsafeBitCast(handle, to: GCallback.self), Unmanaged.passUnretained(data).toOpaque(), unsafeBitCast(destroyHandle, to: GClosureNotify.self), G_CONNECT_AFTER)
		data.id = id
		signals[id] = data
		return id
	}

}
