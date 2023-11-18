//
//  SearchRepository.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

import Foundation

protocol SearchRepositoryProtocol: AnyObject {
  func search(input: String) async -> [GIFModel]
}

class SearchRepository: SearchRepositoryProtocol {
  let request: Requestable

  init(request: Requestable = API()) {
    self.request = request
  }

  func search(input: String) async -> [GIFModel] {
    do {
      let response: SearchResponse = try await request.fetch(endpoint: .search(input: input))
      return response.gifs
    } catch {
      return []
    }
  }
}
