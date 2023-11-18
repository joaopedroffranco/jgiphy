//
//  RandomViewModelStub.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

enum GIFViewModelStub {
  static let regular = GIFViewModel(
    title: "title",
    description: "description",
    rating: "rating",
    gifMedia: MediaViewModelStub.regular,
    imageMedia: MediaViewModelStub.regular
  )

  static let array = [
    GIFViewModelStub.regular,
    GIFViewModelStub.regular,
    GIFViewModelStub.regular,
    GIFViewModelStub.regular
  ]
}
