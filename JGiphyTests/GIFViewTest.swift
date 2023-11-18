//
//  RandomScreenViewTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import XCTest
@testable import JGiphy

final class GIFViewTest: XCTestCase {
  func testSetViewModel() {
    let viewModel = GIFViewModelStub.regular
    let view = GIFView()
    view.setupView()

    view.viewModel = viewModel

    XCTAssertEqual(view.ratingLabel.value, viewModel.rating)
    XCTAssertEqual(view.gifDescLabel.text, viewModel.description)
    XCTAssertEqual(view.gifTitleLabel.text, viewModel.title)
  }

  func testSetViewModelWhenNoGif() {
    let view = GIFView()
    view.setupView()

    view.viewModel = nil

    XCTAssertNil(view.ratingLabel.value)
    XCTAssertNil(view.gifDescLabel.text)
    XCTAssertNil(view.gifTitleLabel.text)
  }
}
