//
//  RandomViewModel.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

struct GIFViewModel: Equatable {
  let title: String
  let description: String
  let rating: String
  let gifMedia: MediaViewModel
  let imageMedia: MediaViewModel?

  init(
    title: String,
    description: String,
    rating: String,
    gifMedia: MediaViewModel,
    imageMedia: MediaViewModel
  ) {
    self.title = title
    self.description = description
    self.rating = rating
    self.gifMedia = gifMedia
    self.imageMedia = imageMedia
  }

  init?(from model: GIFModel) {
    guard let gifMedia = MediaViewModel(from: model.media) else { return nil }

    self.title = model.title
    self.description = gifMedia.url.absoluteString
    self.rating = model.rating
    self.gifMedia = gifMedia
    self.imageMedia = MediaViewModel(from: model.staticMedia)
  }
}
