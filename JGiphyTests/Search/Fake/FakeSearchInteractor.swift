//
//  FakeSearchInteractor.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

class FakeSearchInteractor: SearchInteractable {
  let viewModels: [GIFViewModel]

  init(viewModels: [GIFViewModel]) {
    self.viewModels = viewModels
  }

  func get(input: String) async -> [GIFViewModel] {
    viewModels
  }
}
