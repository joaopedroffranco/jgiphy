//
//  FakeRandomInteractor.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

class FakeRandomInteractor: RandomInteractable {

  let viewModel: GIFViewModel?

  init(viewModel: GIFViewModel?) {
    self.viewModel = viewModel
  }

  func getRandomViewModel() async -> GIFViewModel? {
    viewModel
  }
}
