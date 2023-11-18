//
//  RandomRepositoryTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import XCTest
@testable import JGiphy

final class RandomRepositoryTest: XCTestCase {

  func testFetch() async {
    let request = FakeRequestable(jsonFile: JSONFile.random)
    let repository = RandomRepository(request: request)

    guard let model = await repository.fetchRandom() else {
      return XCTFail("Couldn't fetch the random gif")
    }

    XCTAssertNotNil(model)
  }
}
