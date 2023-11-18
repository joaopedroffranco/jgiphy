//
//  RandomResponse.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

import Foundation

struct RandomResponse: Decodable {
  let gif: GIFModel

  enum CodingKeys: String, CodingKey {
    case gif = "data"
  }
}
