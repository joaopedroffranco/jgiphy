//
//  RandomInteractorTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import XCTest
@testable import JGiphy

final class RandomInteractorTest: XCTestCase {

  func testRepositorySucceed() async throws {
    let fetchedGifModel = GIFModelStub.regular
    let randomRepository = FakeRandomRepository(fetchedGIFModel: fetchedGifModel)
    let interactor = RandomInteractor(repository: randomRepository)

    guard let viewModel = await interactor.getRandomViewModel() else {
      return XCTFail("Couldn't fetch the viewModel")
    }

    let assertViewModel = GIFViewModel(from: fetchedGifModel)
    XCTAssertEqual(viewModel, assertViewModel)
  }

  func testRepositoryFailed() async throws {
    let randomRepository = FakeRandomRepository(fetchedGIFModel: nil)
    let interactor = RandomInteractor(repository: randomRepository)

    let viewModel = await interactor.getRandomViewModel()
    XCTAssertNil(viewModel)
  }
}
