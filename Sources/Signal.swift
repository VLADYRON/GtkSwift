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

class Signal {
	var object: Object
	var id: gulong?
	init(object: Object) {
		self.object = object
	}
}

class SignalZero: Signal {
	typealias Callback = () -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
class SignalOne: Signal {
	typealias Callback = (UnsafeMutableRawPointer) -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
class SignalTwo: Signal {
	typealias Callback = (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
class SignalThree: Signal {
	typealias Callback = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
class SignalFour: Signal {
	typealias Callback = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
class SignalFive: Signal {
	typealias Callback = (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void
	var callback: Callback
	init(object: Object, closure:  @escaping Callback) {
		self.callback = closure
		super.init(object: object)
	}
}
