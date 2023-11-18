//
//  SearchInteractorTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import XCTest
@testable import JGiphy

final class SearchInteractorTest: XCTestCase {

  private let whatever = ""

  func testRepositorySucceed() async throws {
    let searchedGifModels = GIFModelStub.models
    let searchRepository = FakeSearchRepository(searchedGIFModels: searchedGifModels)
    let interactor = SearchInteractor(repository: searchRepository)

    let viewModel = await interactor.get(input: whatever)
    XCTAssertEqual(viewModel.count, 3)
  }

  func testRepositoryFailed() async throws {
    let searchRepository = FakeSearchRepository(searchedGIFModels: [])
    let interactor = SearchInteractor(repository: searchRepository)

    let viewModel = await interactor.get(input: whatever)
    XCTAssertEqual(viewModel.count, 0)
  }
}
