//
//  MediaModel.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import Foundation

struct MediaModel: Decodable, Equatable {
  let url: String
  let width: String
  let height: String

  init(url: String, width: String, height: String) {
    self.url = url
    self.width = width
    self.height = height
  }
}
