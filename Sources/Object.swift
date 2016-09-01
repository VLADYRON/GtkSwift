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
	private static var signals: [gulong: Signal] = [:]

	internal let object: UnsafeMutablePointer<GObject>

	internal init?(object: UnsafeMutableRawPointer?) {
		guard let object = object else {
			return nil
		}
		self.object = unsafeBitCast(object, to: UnsafeMutablePointer<GObject>.self)
		g_object_set_data(self.object, "instanceReference", unsafeBitCast(self, to: gpointer.self))
	}
	internal static func get(object: UnsafeMutableRawPointer?) -> Object? {
		guard let object = object else {
			return nil
		}
		let objectP = unsafeBitCast(object, to: UnsafeMutablePointer<GObject>.self)
		return unsafeBitCast(g_object_get_data(objectP, "instanceReference"), to: Object.self)
	}

	private func setSignal(_ name: String, _ signal: Signal, _ handle: GCallback) {
		let destroyHandle: @convention(c) (UnsafeMutableRawPointer) -> Void = {
			Object.signals.removeValue(forKey: unsafeBitCast($0, to: SignalZero.self).id!)
		}
		let signalPtr = Unmanaged.passUnretained(signal).toOpaque()
		let destroyHandlePtr = unsafeBitCast(destroyHandle, to: GDestroyNotify.self)

		g_object_set_data_full(object, name, signalPtr, destroyHandlePtr)
		let id = g_signal_connect_data(object, name, handle, signalPtr, nil, G_CONNECT_AFTER)
		signal.id = id
		Object.signals[id] = signal
	}

	internal func connect(signal: String, closure: @escaping () -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($1, to: SignalZero.self).callback()
		}
		setSignal(signal, SignalZero(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
	internal func connect(signal: String, closure: @escaping (UnsafeMutableRawPointer) -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($2, to: SignalOne.self).callback($1)
		}
		setSignal(signal, SignalOne(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
	internal func connect(signal: String, closure: @escaping (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($3, to: SignalTwo.self).callback($1, $2)
		}
		setSignal(signal, SignalTwo(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
	internal func connect(signal: String, closure: @escaping (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($4, to: SignalThree.self).callback($1, $2, $3)
		}
		setSignal(signal, SignalThree(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
	internal func connect(signal: String, closure: @escaping (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($5, to: SignalFour.self).callback($1, $2, $3, $4)
		}
		setSignal(signal, SignalFour(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
	internal func connect(signal: String, closure: @escaping (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void) {
		let handle: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
			unsafeBitCast($6, to: SignalFive.self).callback($1, $2, $3, $4, $5)
		}
		setSignal(signal, SignalFive(object: self, closure: closure), unsafeBitCast(handle, to: GCallback.self))
	}
}
