//
//  FileRepository.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 11.09.23.
//

import Foundation

class FileRepository {
  func get(file: JSONFile) -> Data? {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: file.rawValue, withExtension: "json") else {
      return nil
    }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      return nil
    }
  }
}
