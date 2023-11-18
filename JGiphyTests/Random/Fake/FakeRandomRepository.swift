//
//  FakeRandomRepository.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

class FakeRandomRepository: RandomRepositoryProtocol {

  let fetchedGIFModel: GIFModel?

  init(fetchedGIFModel: GIFModel?) {
    self.fetchedGIFModel = fetchedGIFModel
  }

  func fetchRandom() async -> GIFModel? {
    fetchedGIFModel
  }
}
