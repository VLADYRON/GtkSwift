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
//import CGtk
//
//public class Adjustment: Object {
//	internal var adjustment: UnsafeMutablePointer<GtkAdjustment> {
//		get {
//			return unsafeBitCast(object, to: UnsafeMutablePointer<GtkAdjustment>.self)
//		}
//	}
//	internal override init(object: UnsafeMutableRawPointer?) {
//		super.init(object: object)
//
//		connect(signal: "value-changed") { [unowned self] in self.valueChanged?(self) }
//		connect(signal: "changed") { [unowned self] in self.changed?(self) }
//	}
//
////	public convenience init?(value: Double, lower: Double, upper: Double, stepIncrement: Double, pageIncrement: Double, pageSize: Double) {
//		self.init(object: gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize))
//	}
//
//	public var value: Double {
//		get {
//			return gtk_adjustment_get_value(adjustment)
//		}
//		set {
//			gtk_adjustment_set_value(adjustment, newValue)
//		}
//	}
//	public var lower: Double {
//		get {
//			return gtk_adjustment_get_lower(adjustment)
//		}
//		set {
//			gtk_adjustment_set_lower(adjustment, newValue)
//		}
//	}
//	public var upper: Double {
//		get {
//			return gtk_adjustment_get_upper(adjustment)
//		}
//		set {
//			gtk_adjustment_set_upper(adjustment, newValue)
//		}
//	}
//	public var stepIncrement: Double {
//		get {
//			return gtk_adjustment_get_step_increment(adjustment)
//		}
//		set {
//			gtk_adjustment_set_step_increment(adjustment, newValue)
//		}
//	}
//	public var pageIncrement: Double {
//		get {
//			return gtk_adjustment_get_page_increment(adjustment)
//		}
//		set {
//			gtk_adjustment_set_page_increment(adjustment, newValue)
//		}
//	}
//	public var pageSize: Double {
//		get {
//			return gtk_adjustment_get_page_size(adjustment)
//		}
//		set {
//			gtk_adjustment_set_page_size(adjustment, newValue)
//		}
//	}
//	public var minimumIncrement: Double {
//		get {
//			return gtk_adjustment_get_minimum_increment(adjustment)
//		}
//	}
//
//	public func clampPage(lower: Double, upper: Double) {
//		gtk_adjustment_clamp_page(adjustment, lower, upper)
//	}
//	public func configure(value: Double, lower: Double, upper: Double, stepIncrement: Double, pageIncrement: Double, pageSize: Double) {
//		gtk_adjustment_configure(adjustment, value, lower, upper, stepIncrement, pageIncrement, pageSize)
//	}
//
//	public var valueChanged: ((Adjustment) -> Void)?
//	public var changed: ((Adjustment) -> Void)?
//}
