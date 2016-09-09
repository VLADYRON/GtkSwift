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

protocol Enumeration {
  var raw: UInt32 { get }
  init?(bit: UInt32)
}

extension Array where Element: Enumeration {
  var mask: UInt32 {
    return self.map {
      $0.raw
    }.reduce(0, |)
  }
  init(bits: UInt32) {
    self.init()
    for i in sequence(first: UInt32(1), next: { $0 != (1 << 31) ? $0 << 1 : nil }) {
      if i & bits == i {
        guard let e = Element(bit: i) else {
          continue
        }
        append(e)
      }
    }
  }
}