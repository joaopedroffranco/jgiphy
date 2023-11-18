//
//  RandomInteractor.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

protocol RandomInteractable: AnyObject {
  func getRandomViewModel() async -> GIFViewModel?
}

class RandomInteractor: RandomInteractable {

  let repository: RandomRepositoryProtocol

  init(repository: RandomRepositoryProtocol = RandomRepository()) {
    self.repository = repository
  }

  func getRandomViewModel() async -> GIFViewModel? {
    guard let model = await repository.fetchRandom() else { return nil }
    return GIFViewModel(from: model)
  }
}
