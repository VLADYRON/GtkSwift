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
//public class FrameClock: Object {
//  var frameClock: OpaquePointer {
//    return unsafeBitCast(object, to: OpaquePointer.self)
//  }
//
//  static func make(_ object: UnsafeMutablePointer<GObject>?) -> FrameClock? {
//    guard let object = object else { return nil }
////    let obj = unsafeBitCast(object, to: UnsafeMutablePointer<GObject>.self)
//    if let instance = g_object_get_data(object, "swift-instance") {
//      return Unmanaged<FrameClock>.fromOpaque(instance).takeUnretainedValue()
//    } else {
//      return FrameClock(from: object)
//    }
//  }
//
//  public enum Phase {
//    case none
//    case update
//    case layout
//    case paint
//
//    var raw: GdkFrameClockPhase {
//      switch self {
//      case .none:   return GDK_FRAME_CLOCK_PHASE_NONE
//      case .update: return GDK_FRAME_CLOCK_PHASE_UPDATE
//      case .layout: return GDK_FRAME_CLOCK_PHASE_LAYOUT
//      case .paint:  return GDK_FRAME_CLOCK_PHASE_PAINT
//      }
//    }
//    init?(bit: UInt32) {
//      switch GdkFrameClockPhase(rawValue: bit) {
//      case GDK_FRAME_CLOCK_PHASE_NONE:   self = .none
//      case GDK_FRAME_CLOCK_PHASE_UPDATE: self = .update
//      case GDK_FRAME_CLOCK_PHASE_LAYOUT: self = .layout
//      case GDK_FRAME_CLOCK_PHASE_PAINT:  self = .paint
//      default: return nil
//      }
//    }
//  }
//
//  public var time: CLong { return gdk_frame_clock_get_frame_time(frameClock) }
//  public var count: CLong { return gdk_frame_clock_get_frame_counter(frameClock) }
//  public var historyStart: CLong { return gdk_frame_clock_get_history_start(frameClock) }
//  public func request(phase: Phase) { gdk_frame_clock_request_phase(frameClock, phase.raw) }
//  public func beginUpdating() { gdk_frame_clock_begin_updating(frameClock) }
//  public func endUpdating() { gdk_frame_clock_end_updating(frameClock) }
//  public func refreshInfo(at baseTime: CLong) -> (refreshInterval: CLong, presentationTime: CLong) {
//    var ret = (0, 0)
//    gdk_frame_clock_get_refresh_info(frameClock, baseTime, &ret.0, &ret.1)
//    return ret
//  }
//  public func timings(at frame: CLong) -> FrameTimings? { return FrameTimings(from: gdk_frame_clock_get_timings(frameClock, frame)) }
//  public var currentTimings: FrameTimings? { return FrameTimings(from: gdk_frame_clock_get_current_timings(frameClock)) }
//
//  public var layout: LayoutSignal { return LayoutSignal(instance: self) }
////  public var paint: PaintSignal { return PaintSignal(frameClock.frameClock) }
////  public var update: UpdateSignal { return UpdateSignal(frameClock.frameClock) }
//}
//
//
//public struct LayoutSignal: Signal {
//  public typealias Source = FrameClock
//  typealias Function = (FrameClock) -> Void
//  var instance: Source
//  init(instance: Source) { self.instance = instance}
//
//  static func callback(source: Source, with function: Function) {
////    let source = FrameClock.make(source)!
////    let callback = source.get(signal: data) as Function!
//    function(source)
//  }
//}
////public struct PaintSignal: Signal {
////  typealias Instance = OpaquePointer
////  var instance: UnsafeMutableRawPointer!
////  private typealias Function = (FrameClock) -> Void
////  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
////    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
////      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(FrameClock.make($0)!)
////    }
////    return connectSignal(signal: "paint", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
////  }
////}
////public struct UpdateSignal: Signal {
////  typealias Instance = OpaquePointer
////  var instance: UnsafeMutableRawPointer!
////  private typealias Function = (FrameClock) -> Void
////  @discardableResult public func connect(swapped: Bool = false, to function: Function) -> UInt {
////    let callback: (@convention(c)(Instance, UnsafeRawPointer) -> Void) = {
////      (Unmanaged<Data>.fromOpaque($1).takeUnretainedValue().function as! Function)(FrameClock.make($0)!)
////    }
////    return connectSignal(signal: "update", swapped: swapped, to: function, unsafeBitCast(callback, to: GCallback.self))
////  }
////}
