//
//  FakeRequestable.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit
@testable import JGiphy

enum FakeRequestableError: Error {
  case invalidResponse
}

class FakeRequestable: Requestable {

  let fileRepository = FileRepository()
  let jsonFile: JSONFile

  init(jsonFile: JSONFile) {
    self.jsonFile = jsonFile
  }

  func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
    guard
      let data = fileRepository.get(file: jsonFile),
      let response = try? JSONDecoder().decode(T.self, from: data)
    else {
      throw FakeRequestableError.invalidResponse
    }

    return response
  }
}
