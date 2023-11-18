//
//  RequestManager.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import Foundation

protocol Requestable: AnyObject {
  func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T
}

enum Endpoint {
  case random
  case search(input: String)

  var request: URLRequest? {
    var urlComponents = URLComponents(string: path)
    var queries = [URLQueryItem(name: "api_key", value: token)]
    if let params { queries += params }

    urlComponents?.queryItems = queries

    guard
      let string = urlComponents?.string,
      let url = URL(string: string)
    else {
      return nil
    }

    return URLRequest(url: url)
  }

  private var token: String {
    "c2zhJAWwvZMMBJ0qP3RzlobjO1zKjagh"
  }

  private var path: String {
    switch self {
    case .random: return "https://api.giphy.com/v1/gifs/random"
    case .search: return "https://api.giphy.com/v1/gifs/search"
    }
  }

  private var params: [URLQueryItem]? {
    switch self {
    case .random: return nil
    case let .search(input): return [
      URLQueryItem(name: "q", value: input),
      URLQueryItem(name: "limit", value: "30")
    ]
    }
  }
}
