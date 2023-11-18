//
//  SearchResponseTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 11.09.23.
//

import XCTest
@testable import JGiphy

final class SearchResponseTests: XCTestCase {
  func testDecode() {
    guard
      let data = FileRepository().get(file: .search),
      let response = try? JSONDecoder().decode(SearchResponse.self, from: data)
    else {
      return XCTFail("Couldn't decode")
    }

    let models = response.gifs

    XCTAssertEqual(models.count, 2)
  }

  func testDecodeEmpty() {
    guard
      let data = FileRepository().get(file: .searchEmpty),
      let response = try? JSONDecoder().decode(SearchResponse.self, from: data)
    else {
      return XCTFail("Couldn't decode")
    }

    let models = response.gifs

    XCTAssertEqual(models.count, 0)
  }
}
