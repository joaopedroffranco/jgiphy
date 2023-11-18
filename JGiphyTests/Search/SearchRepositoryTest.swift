//
//  SearchRepositoryTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

import XCTest
@testable import JGiphy

final class SearchRepositoryTest: XCTestCase {

  private let whatever = ""

  func testSearch() async {
    let request = FakeRequestable(jsonFile: .search)
    let repository = SearchRepository(request: request)

    let models = await repository.search(input: whatever)
    XCTAssertFalse(models.isEmpty)
  }

  func testEmptySearch() async {
    let request = FakeRequestable(jsonFile: .searchEmpty)
    let repository = SearchRepository(request: request)

    let models = await repository.search(input: whatever)
    XCTAssertTrue(models.isEmpty)
  }
}
