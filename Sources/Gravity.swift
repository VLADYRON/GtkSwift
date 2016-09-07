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

public enum Gravity {
	case North
	case NorthWest
	case West
	case SouthWest
	case South
	case SouthEast
	case East
	case NorthEast
	case Static
	case Center
	
	internal var value: GdkGravity { get{
		switch self {
		case .North:
			return GDK_GRAVITY_NORTH
		case .NorthWest:
			return GDK_GRAVITY_NORTH_WEST
		case .West:
			return GDK_GRAVITY_WEST
		case .SouthWest:
			return GDK_GRAVITY_SOUTH_WEST
		case .South:
			return GDK_GRAVITY_SOUTH
		case .SouthEast:
			return GDK_GRAVITY_SOUTH_EAST
		case .East:
			return GDK_GRAVITY_EAST
		case .NorthEast:
			return GDK_GRAVITY_NORTH_EAST
		case .Static:
			return GDK_GRAVITY_STATIC
		case .Center:
			return GDK_GRAVITY_CENTER
		}
	}}
	internal static func make(value: GdkGravity) -> Gravity {
		switch value {
		case GDK_GRAVITY_NORTH:
			return North
		case GDK_GRAVITY_NORTH_WEST:
			return NorthWest
		case GDK_GRAVITY_WEST:
			return West
		case GDK_GRAVITY_SOUTH_WEST:
			return SouthWest
		case GDK_GRAVITY_SOUTH:
			return South
		case GDK_GRAVITY_SOUTH_EAST:
			return SouthEast
		case GDK_GRAVITY_EAST:
			return East
		case GDK_GRAVITY_NORTH_EAST:
			return NorthEast
		case GDK_GRAVITY_STATIC:
			return Static
		default:
			return Center
		}
	}
}
