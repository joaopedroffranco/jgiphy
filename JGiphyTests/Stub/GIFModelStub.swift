//
//  GIFModelStub.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import Foundation
@testable import JGiphy

enum GIFModelStub {
  static let regular = GIFModel(
    id: "id",
    title: "title",
    rating: "18+",
    media: MediaModelStub.regular,
    staticMedia: MediaModelStub.regular
  )

  static let models: [GIFModel] = [
    GIFModelStub.regular,
    GIFModelStub.regular,
    GIFModelStub.regular
  ]
}
