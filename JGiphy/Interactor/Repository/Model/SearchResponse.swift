//
//  SearchResponse.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

import Foundation

struct SearchResponse: Decodable {
  let gifs: [GIFModel]

  enum CodingKeys: String, CodingKey {
    case gifs = "data"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.gifs = try container.decode([GIFModel].self, forKey: .gifs)
  }
}
