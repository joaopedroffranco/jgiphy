//
//  API.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import Foundation

enum APIError: Error {
  case invalidRequest
  case decodeError
}

class API: Requestable {
  let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }

  func fetch<T>(endpoint: Endpoint) async throws -> T where T: Decodable {
    guard let request = endpoint.request else {
      throw APIError.invalidRequest
    }

    let (data, _) = try await session.data(for: request)
    let decoder = JSONDecoder()

    do {
      return try decoder.decode(T.self, from: data)
    } catch {
      throw APIError.decodeError
    }

  }
}
