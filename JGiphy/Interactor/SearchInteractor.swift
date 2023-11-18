//
//  SearchInteractor.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

protocol SearchInteractable: AnyObject {
  func get(input: String) async -> [GIFViewModel]
}

class SearchInteractor: SearchInteractable {

  let repository: SearchRepositoryProtocol

  init(repository: SearchRepositoryProtocol = SearchRepository()) {
    self.repository = repository
  }

  func get(input: String) async -> [GIFViewModel] {
    let models = await repository.search(input: input)
    return models.compactMap { GIFViewModel(from: $0) }
  }
}
