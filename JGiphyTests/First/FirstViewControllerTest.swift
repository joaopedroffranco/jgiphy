//
//  FirstViewControllerTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 10.09.23.
//

import XCTest
@testable import JGiphy

final class FirstControllerTest: XCTestCase {

  private let whatever = ""

  func testViewDidLoad() {
    let presenter = FakeFirstPresenter()
    let controller = FirstViewController(presenter: presenter)

    controller.loadView()
    controller.viewDidLoad()

    XCTAssertEqual(controller.gifView.viewModel, GIFViewModelStub.regular)
    XCTAssertFalse(controller.gifView.isHidden)
    XCTAssertTrue(controller.searchCollectionView.isHidden)
  }

  func testStartSearching() {
    let presenter = FakeFirstPresenter()
    let controller = FirstViewController(presenter: presenter)

    controller.loadView()
    controller.viewDidLoad()
    controller.didChange(text: whatever)

    XCTAssertEqual(controller.searchCollectionView.viewModels, GIFViewModelStub.array)
    XCTAssertTrue(controller.gifView.isHidden)
    XCTAssertFalse(controller.searchCollectionView.isHidden)
  }

  func testDidCancelSearch() {
    let presenter = FakeFirstPresenter()
    let controller = FirstViewController(presenter: presenter)

    controller.loadView()
    controller.didChange(text: whatever)
    controller.didCancel()

    XCTAssertEqual(controller.gifView.viewModel, GIFViewModelStub.regular)
    XCTAssertFalse(controller.gifView.isHidden)
    XCTAssertTrue(controller.searchCollectionView.isHidden)
  }

  func testDidSelectGif() {
    let selectedViewModel = GIFViewModelStub.regular
    let presenter = FakeFirstPresenter()
    let controller = FirstViewController(presenter: presenter)

    controller.loadView()
    controller.didSelect(gif: selectedViewModel)

    XCTAssertEqual(presenter.selectedViewModel, selectedViewModel)
  }
}

