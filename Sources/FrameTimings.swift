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
//public class FrameTimings {
//  private var handle: OpaquePointer
//  init?(from ptr: OpaquePointer?) {
//    guard let ptr = ptr else { return nil }
//    handle = gdk_frame_timings_ref(ptr)
//  }
//  deinit {
//    gdk_frame_timings_unref(handle)
//  }
//
//  public var frameCounter: CLong { return gdk_frame_timings_get_frame_counter(handle) }
//  public var complete: Bool { return gdk_frame_timings_get_complete(handle) != 0}
//  public var frameTime: CLong { return gdk_frame_timings_get_frame_time(handle) }
//  public var presentationTime: CLong { return gdk_frame_timings_get_presentation_time(handle) }
//  public var refreshInterval: CLong { return gdk_frame_timings_get_refresh_interval(handle) }
//  public var predictedPresentationTime: CLong{ return gdk_frame_timings_get_predicted_presentation_time(handle) }
//
//}