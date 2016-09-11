///
/// This file is part of GtkSwift. Copyright (C) 2016  Tim Diekmann
///
/// GtkSwift is free software: you can redistribute it and/or modify
/// it under the terms of the GNU Lesser General Public License as published
/// by the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// GtkSwift is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU Lesser General Public License for more details.
///
/// You should have received a copy of the GNU Lesser General Public License
/// along with GtkSwift. If not, see <http://www.gnu.org/licenses/>.
///

import CGtk

class ClassWrapper<T> {
  var instance: T
  init(_ instance: T) {
    self.instance = instance
  }
}
//
//public class Object: GObject, GClass {
//  public var gPointer: UnsafeMutablePointer<CGtk.GObject>
//
//  public required init(from pointer: UnsafeMutablePointer<CGtk.GObject>) {
//    gPointer = pointer
//  }
//
//  private static let destructor: @convention(c) (UnsafeRawPointer) -> Void = {
//    Unmanaged<AnyObject>.fromOpaque($0).release()
//  }
//
//  static var closureNotify: GClosureNotify {
//    return unsafeBitCast(destructor, to: GClosureNotify.self)
//  }
//  static var destroyNotify: GDestroyNotify {
//    return unsafeBitCast(destructor, to: GDestroyNotify.self)
//  }
//}

//
//public struct GObjectIterator: IteratorProtocol {
//  public typealias Element = (String, Any)
//
//  var iterator: Set<String>.Iterator
//  let set: Set<String>
//  var object: GObject
//
//  init(object: GObject, set: Set<String>) {
//    self.set = set
//    self.object = object
//    iterator = set.makeIterator()
//
//  }
//
//  public mutating func next() -> Element? {
//    guard let e1: String = iterator.next() else {
//      return nil
//    }
//    return (e1, get(e1))
//  }
//
//  private func get(_ index: String) -> Any {
//    let data = Unmanaged<AnyObject>.fromOpaque(g_object_get_data(object.gPointer, index)).takeUnretainedValue()
//    switch data {
//      case let data as ClassWrapper<Any>: return data.instance
//      default: return data
//    }
//  }
//}

//  //    switch Unmanaged<AnyObject>.fromOpaque(data).takeUnretainedValue() {
//  //      case let data as Storage: return data.data as? T
//  //      default: return data as? T
//  //    }
//
//extension Object: Sequence {
//  public typealias Iterator = GObjectIterator
//
//  public func makeIterator() -> Iterator {
//    return GObjectIterator(object: self, set: set)
//  }
//
//  var set: Set<String> {
//    return Unmanaged<ClassWrapper<Set<String>>>.fromOpaque(g_object_get_data(gPointer, "_g_object_indices_set")).takeUnretainedValue().instance
//  }
//  var wrappedSet: ClassWrapper<Set<String>> {
//    return Unmanaged<ClassWrapper<Set<String>>>.fromOpaque(g_object_get_data(gPointer, "_g_object_indices_set")).takeUnretainedValue()
//  }
//
//  func insert(_ index: String, _ newValue: Any) {
////    guard let newValue = newValue else {
////      g_object_set_data(handle, label, nil)
////      return
////    }
//    let data: AnyObject
//    switch newValue {
//      case let newValue as AnyObject:  data = newValue
//      default:                         data = ClassWrapper(newValue)
//    }
//    let object = Unmanaged.passRetained(data).toOpaque()
//    g_object_set_data_full(gPointer, index, object, GObject.destroyNotify)
//    Unmanaged<ClassWrapper<Set<String>>>.fromOpaque(g_object_get_data(gPointer, "_g_object_indices_set")).takeUnretainedValue().instance.insert(index)
//  }
//
//  //  public typealias Indices = Set<String>.Indices
//  //  public typealias Index = Set<String>.Index
//  //  public typealias Iterator = Set<String>.Iterator
//  //  public typealias SubSequence = Set<String>.SubSequence
//  //
//  //  public var indices: Indices {
//  //    return set.indices
//  //  }
//  //  public var startIndex: Index {
//  //    return set.startIndex
//  //  }
//  //  public var endIndex: Index {
//  //    return set.endIndex
//  //  }
//  //  public func index(after i: Index) -> Index {
//  //    return set.index(after: i)
//  //  }
//  //
//  //  public func makeIterator() -> Iterator {
//  //    return set.makeIterator()
//  //  }
//  //    public var startIndex: Index {
//  //      return dict.startIndex
//  //    }
//  //    public var endIndex: Index {
//  //      return dict.endIndex
//  //    }
//}

class Widget : Object {}

enum Test<T> {
//  let type =  T.Type
//  let property = String

  case attachedTo(T, String)

//  init(property: String, type: T.Type) { self.property = property, self.type = type }
}

let handler: @convention(c) (UnsafeMutablePointer<CGtk.GtkApplication>, UnsafeMutableRawPointer) -> Void = {
  app, _ in
  let builder = gtk_builder_new_from_file("ui/builder.ui")
  let window = unsafeBitCast(gtk_builder_get_object(builder, "window"), to: UnsafeMutablePointer<CGtk.GtkWidget>.self)

  g_object_unref(builder)

  window.withMemoryRebound(to: GtkWindow.self, capacity: 1) {
    gtk_application_add_window(app, $0)
    gtk_window_set_title($0, "Window")
  }

  gtk_widget_show_all(window)

  let object = Object(from: unsafeBitCast(window, to: UnsafeMutablePointer<CGtk.GObject>.self))

  for (name, spec) in object {
    print(" ", name, spec)
  }
  gtk_widget_destroy(window)

}


let app = gtk_application_new("GtkSwift.example", G_APPLICATION_FLAGS_NONE)
g_signal_connect_data(app, "activate", unsafeBitCast(handler, to: GCallback.self), nil, nil, G_CONNECT_AFTER)
g_application_run(unsafeBitCast(app, to: UnsafeMutablePointer<CGtk.GApplication>.self), 0, nil)
g_object_unref(app)