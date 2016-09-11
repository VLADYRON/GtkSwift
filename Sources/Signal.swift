/////
///// This file is part of GtkSwift. Copyright (C) 2016  Tim Diekmann
/////
///// GtkSwift is free software: you can redistribute it and/or modify
///// it under the terms of the GNU Lesser General Public License as published
///// by the Free Software Foundation, either version 3 of the License, or
///// (at your option) any later version.
/////
///// GtkSwift is distributed in the hope that it will be useful,
///// but WITHOUT ANY WARRANTY; without even the implied warranty of
///// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///// GNU Lesser General Public License for more details.
/////
///// You should have received a copy of the GNU Lesser General Public License
///// along with GtkSwift. If not, see <http://www.gnu.org/licenses/>.
/////
//
//import CGtk
//
//protocol Signal {
//  associatedtype Source: Object
//  associatedtype Function
//  var instance: Source { get }
//  static func callback(source: Source, with function: Function)
//}
//
//extension Signal {
//  public func disconnect(from id: UInt) {
//    g_signal_handler_disconnect(unsafeBitCast(instance, to: gpointer.self), id)
//  }
//
//  @discardableResult public func connect(signal: String, swapped: Bool = false, to function: (Source) -> Void) -> UInt {
//    let callback: (@convention(c)(UnsafeMutablePointer<GObject>, UnsafeMutableRawPointer) -> Void) = {
//      let source = Source.make($0)!
//      let function = source.get(signal: $1)! as Function
//      Self.callback(source: source, with: function)
//    }
//    return instance.set(signal: signal, function: function, as: unsafeBitCast(callback, to: GCallback.self))
//  }
//}
