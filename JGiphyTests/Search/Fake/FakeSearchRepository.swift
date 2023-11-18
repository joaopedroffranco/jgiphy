//
//  FakeSearchRepository.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

class FakeSearchRepository: SearchRepositoryProtocol {

  let searchedGIFModels: [GIFModel]

  init(searchedGIFModels: [GIFModel]) {
    self.searchedGIFModels = searchedGIFModels
  }

  func search(input: String) async -> [GIFModel] {
    searchedGIFModels
  }
}
