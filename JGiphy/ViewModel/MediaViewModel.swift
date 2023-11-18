//
//  MediaViewModel.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

struct MediaViewModel: Equatable {
  let url: URL
  let width: CGFloat
  let height: CGFloat

  init(url: URL, width: CGFloat, height: CGFloat) {
    self.url = url
    self.width = width
    self.height = height
  }

  init?(from mediaModel: MediaModel) {
    guard let url = URL(string: mediaModel.url) else { return nil }
    self.url = url
    self.width = mediaModel.width.toCGFloat
    self.height = mediaModel.height.toCGFloat
  }
}
