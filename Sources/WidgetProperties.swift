///*
// * GtkSwift Copyright (C) 2016 Tim Diekmann
// * mailto: t.diekmann.3dv@gmail.com
// *
// * This program is free software: you can redistribute it and/or modify
// * it under the terms of the GNU General Public License as published by
// * the Free Software Foundation, either version 3 of the License, or
// * (at your option) any later version.
// *
// * This program is distributed in the hope that it will be useful,
// * but WITHOUT ANY WARRANTY; without even the implied warranty of
// * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// * GNU General Public License for more details.
// *
// * You should have received a copy of the GNU General Public License
// * along with this program. If not, see <http://www.gnu.org/licenses/>.
// */
//
//public extension Widget {
//  var appPaintable: Bool {
//    get { return get(property: "app-paintable")! }
//    set { set(property: "app-paintable", to: newValue) }
//  }
//  var canDefault: Bool {
//    get { return get(property: "can-default")! }
//    set { set(property: "can-default", to: newValue) }
//  }
//  var canFocus: Bool {
//    get { return get(property: "can-focus")! }
//    set { set(property: "can-focus", to: newValue) }
//  }
//  var compositeChild: Bool {
//    get { return get(property: "composite-child")! }
//  }
//  var doubleBuffered: Bool {
//    get { return get(property: "double-buffered")! }
//    set { set(property: "double-buffered", to: newValue) }
//  }
//
//  var events: [EventMask] {
//    get { return [EventMask](bits: UInt32(get(property: "events")! as Int32)) }
//    set { set(property: "events", to: Int32(newValue.mask)) }
//  }
//}