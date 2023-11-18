//
//  Array+Extension.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    (index >= 0 && index < indices.count) ? self[index] : nil
  }
}
