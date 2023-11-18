//
//  RandomRepository.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import Foundation

protocol RandomRepositoryProtocol: AnyObject {
  func fetchRandom() async -> GIFModel?
}

class RandomRepository: RandomRepositoryProtocol {
  let request: Requestable

  init(request: Requestable = API()) {
    self.request = request
  }

  func fetchRandom() async -> GIFModel? {
    do {
      let response: RandomResponse = try await request.fetch(endpoint: .random)
      return response.gif
    } catch {
      return nil
    }
  }
}
