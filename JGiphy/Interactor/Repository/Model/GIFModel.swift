//
//  GIFModel.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import Foundation

struct GIFModel: Decodable, Equatable {
  let id: String
  let title: String
  let rating: String
  let media: MediaModel
  let staticMedia: MediaModel

  enum RootKeys: String, CodingKey {
    case id, title, rating, images
  }

  enum MediaKeys: String, CodingKey {
    case media = "fixed_width"
    case staticMedia = "fixed_width_still"
    case downsizeMedia = "downsized"
    case downsizeStaticMedia = "downsized_still"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: RootKeys.self)
    id = try container.decode(String.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    rating = try container.decode(String.self, forKey: .rating)

    let imagesContainer = try container.nestedContainer(keyedBy: MediaKeys.self, forKey: .images)
    media = try imagesContainer.decode(MediaModel.self, forKey: .media)
    staticMedia = try imagesContainer.decode(MediaModel.self, forKey: .staticMedia)
  }

  init(id: String, title: String, rating: String, media: MediaModel, staticMedia: MediaModel) {
    self.id = id
    self.title = title
    self.rating = rating
    self.media = media
    self.staticMedia = staticMedia
  }
}
