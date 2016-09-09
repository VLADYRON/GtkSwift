/*
 * GtkSwift Copyright (C) 2016 Tim Diekmann
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


public enum EventMask: Enumeration {
  case exposure
  case pointerMotion
  case buttonMotion
  case button1Motion
  case button2Motion
  case button3Motion
  case buttonPress
  case buttonRelease
  case keyPress
  case keyRelease
  case enterNotify
  case leaveNotify
  case focusChange
  case structure
  case propertyChange
  case visibilityNotify
  case proximityIn
  case proximityOut
  case substructure
  case scroll
  case touch
  case smoothScroll
  case touchpadGesture
  case allEvents
  
  var raw: UInt32 {
    switch self {
    case .exposure:         return GDK_EXPOSURE_MASK.rawValue
    case .pointerMotion:    return GDK_POINTER_MOTION_MASK.rawValue
    case .buttonMotion:     return GDK_BUTTON_MOTION_MASK.rawValue
    case .button1Motion:    return GDK_BUTTON1_MOTION_MASK.rawValue
    case .button2Motion:    return GDK_BUTTON2_MOTION_MASK.rawValue
    case .button3Motion:    return GDK_BUTTON3_MOTION_MASK.rawValue
    case .buttonPress:      return GDK_BUTTON_PRESS_MASK.rawValue
    case .buttonRelease:    return GDK_BUTTON_RELEASE_MASK.rawValue
    case .keyPress:         return GDK_KEY_PRESS_MASK.rawValue
    case .keyRelease:       return GDK_KEY_RELEASE_MASK.rawValue
    case .enterNotify:      return GDK_ENTER_NOTIFY_MASK.rawValue
    case .leaveNotify:      return GDK_LEAVE_NOTIFY_MASK.rawValue
    case .focusChange:      return GDK_FOCUS_CHANGE_MASK.rawValue
    case .structure:        return GDK_STRUCTURE_MASK.rawValue
    case .propertyChange:   return GDK_PROPERTY_CHANGE_MASK.rawValue
    case .visibilityNotify: return GDK_VISIBILITY_NOTIFY_MASK.rawValue
    case .proximityIn:      return GDK_PROXIMITY_IN_MASK.rawValue
    case .proximityOut:     return GDK_PROXIMITY_OUT_MASK.rawValue
    case .substructure:     return GDK_SUBSTRUCTURE_MASK.rawValue
    case .scroll:           return GDK_SCROLL_MASK.rawValue
    case .touch:            return GDK_TOUCH_MASK.rawValue
    case .smoothScroll:     return GDK_SMOOTH_SCROLL_MASK.rawValue
    case .touchpadGesture:  return GDK_TOUCHPAD_GESTURE_MASK.rawValue
    case .allEvents:        return GDK_ALL_EVENTS_MASK.rawValue
    }
  }
  init?(bit: UInt32) {
    switch GdkEventMask(rawValue: bit) {
    case GDK_EXPOSURE_MASK:          self = .exposure
    case GDK_POINTER_MOTION_MASK:    self = .pointerMotion
    case GDK_BUTTON_MOTION_MASK:     self = .buttonMotion
    case GDK_BUTTON1_MOTION_MASK:    self = .button1Motion
    case GDK_BUTTON2_MOTION_MASK:    self = .button2Motion
    case GDK_BUTTON3_MOTION_MASK:    self = .button3Motion
    case GDK_BUTTON_PRESS_MASK:      self = .buttonPress
    case GDK_BUTTON_RELEASE_MASK:    self = .buttonRelease
    case GDK_KEY_PRESS_MASK:         self = .keyPress
    case GDK_KEY_RELEASE_MASK:       self = .keyRelease
    case GDK_ENTER_NOTIFY_MASK:      self = .enterNotify
    case GDK_LEAVE_NOTIFY_MASK:      self = .leaveNotify
    case GDK_FOCUS_CHANGE_MASK:      self = .focusChange
    case GDK_STRUCTURE_MASK:         self = .structure
    case GDK_PROPERTY_CHANGE_MASK:   self = .propertyChange
    case GDK_VISIBILITY_NOTIFY_MASK: self = .visibilityNotify
    case GDK_PROXIMITY_IN_MASK:      self = .proximityIn
    case GDK_PROXIMITY_OUT_MASK:     self = .proximityOut
    case GDK_SUBSTRUCTURE_MASK:      self = .substructure
    case GDK_SCROLL_MASK:            self = .scroll
    case GDK_TOUCH_MASK:             self = .touch
    case GDK_SMOOTH_SCROLL_MASK:     self = .smoothScroll
    case GDK_TOUCHPAD_GESTURE_MASK:  self = .touchpadGesture
    case GDK_ALL_EVENTS_MASK:        self = .allEvents
    default: return nil
    }
  }
}