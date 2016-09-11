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
//
//class SignalDictionary<Source> {
//  typealias Value = (Source) -> Void
//  typealias Dict = [Int:Value]
//  var dict: Dict
//  var signal: String
//
//  init(signal: String) {
//    self.signal = signal; dict = Dict()
//  }
//
//  public convenience required init(dictionaryLiteral elements: (Int, Value)...) {
//    self.init()
//    for (key, value) in elements {
//      dict[key] = value
//    }
//  }
//}
//
//extension SignalDictionary: Collection {
//  typealias Iterator = Dict.Iterator
//  typealias SubSequence = Dict.SubSequence
//  typealias Indices = Dict.Indices
//  typealias Index = Dict.Index
//
//  public func makeIterator() -> Iterator {
//    return dict.makeIterator()
//  }
//
//  public subscript(position: Dict.Index) -> Iterator.Element {
//    return dict[position]
//  }
//  public subscript(bounds: Range<Index>) -> SubSequence {
//    return dict[bounds]
//  }
//  public var indices: Indices {
//    return dict.indices
//  }
//  public var startIndex: Index {
//    return dict.startIndex
//  }
//  public var endIndex: Index {
//    return dict.endIndex
//  }
//  public func index(after i: Index) -> Index {
//    return dict.index(after: i)
//  }
//}
//
//extension SignalDictionary: CustomStringConvertible {
//  public var description: String {
//    return dict.description
//  }
//}
//
//extension SignalDictionary: CustomDebugStringConvertible {
//  public var debugDescription: String {
//    return dict.debugDescription
//  }
//}
//
//extension SignalDictionary: CustomReflectable {
//  public var customMirror: Mirror {
//    return dict.customMirror
//  }
//}
//
//extension SignalDictionary: ExpressibleByDictionaryLiteral {
//}
//
////extension
//
//public class Widget: Object {
//  var widget: UnsafeMutablePointer<GtkWidget> {
//    return unsafeBitCast(handle, to: UnsafeMutablePointer<GtkWidget>.self)
//  }
//
//  public required init(from pointer: UnsafeMutablePointer<GObject>) {
//    super.init(from: pointer)
//    self["_destroy_signal"] = [Int: (Widget) -> Void]()
//  }
//  var destroy: [Int:(Widget) -> Void] {
//    get {
//      return self["_destroy_signal"] as! [Int:(Widget) -> Void]
//    } set {
//      self["_destroy_signal"] = newValue
//    }
//  }
//  //
//  //  static func make(_ object: UnsafeMutablePointer<GtkWidget>) -> Widget {
//  //    let object = unsafeBitCast(object, to: UnsafeMutablePointer<GObject>.self)
//  //    if let instance = g_object_get_data(object, "swift-instance") {
//  //      return Unmanaged.fromOpaque(instance).takeUnretainedValue()
//  //    } else {
//  //      return Widget(from: object)
//  //    }
//  //  }
//  //
//  //  public func destroy() { gtk_widget_destroy(widget) }
//  //  var inDestruction: Bool { return gtk_widget_in_destruction(widget) != 0}
//  //  public func show() { gtk_widget_show(widget) }
//  //  public func showNow() { gtk_widget_show_now(widget) }
//  //  public func hide() { gtk_widget_hide(widget) }
//  //  public func showAll() { gtk_widget_show_all(widget) }
//  //
//  //  public func queueDraw() { gtk_widget_queue_draw(widget) }
//  //  public func queueDrawArea<T: SignedInteger>(x: T, y: T, width: T, height: T) {
//  //    gtk_widget_queue_draw_area(widget, numericCast(x), numericCast(y), numericCast(width), numericCast(height))
//  //  }
//  //  public func queueResize(redraw: Bool = true) {
//  //    switch redraw {
//  //    case true: gtk_widget_queue_resize(widget)
//  //    case false: gtk_widget_queue_resize_no_redraw(widget)
//  //    }
//  //  }
//  //  public var scaleFactor: CInt { return gtk_widget_get_scale_factor(widget) }
//  //  public var tick: (Widget, FrameClock) -> Bool {
//  //    get {
//  //      return { _, _ in return false }
//  //    } set {
//  ////^
//  //    }
//}
//
////
////
////  var frameClock: FrameClock? { return FrameClock.make(unsafeBitCast(gtk_widget_get_frame_clock(widget), to: UnsafeMutablePointer<GObject>.self)) }
//////  public func queueAllocate() { gtk_widget_queue_allocate(widget) }
////}
//////func connectSignal(signal: String, swapped: Bool = false, to function: Any, _ callback: @escaping GCallback) -> UInt {
//////  let data = Unmanaged.passRetained(Data(function)).toOpaque()
//////  let destructor: @convention(c) (UnsafeRawPointer) -> Void = {
//////    data in
//////    let _ = Unmanaged<Data>.fromOpaque(data).takeRetainedValue()
//////  }
//////  let cDestructor = unsafeBitCast(destructor, to: GClosureNotify.self)
//////  let object = unsafeBitCast(instance, to: UnsafeMutableRawPointer.self)
//////  return g_signal_connect_data(object, signal, callback, data, cDestructor, swapped ? G_CONNECT_SWAPPED : G_CONNECT_AFTER)/**/
//////}