//
//  String+Extension.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import Foundation

extension String {
  var toCGFloat: CGFloat {
    CGFloat(Double(self) ?? .zero)
  }
}
