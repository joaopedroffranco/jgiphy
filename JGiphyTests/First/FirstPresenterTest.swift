//
//  FirstPresenterTest.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import XCTest
import RxSwift
@testable import JGiphy

final class FirstPresenterTest: XCTestCase {

  private let disposeBag = DisposeBag()
  private let whatever = ""

  /// Random Tests
  func testStartRandom() throws {
    let viewModel = GIFViewModelStub.regular
    var assertState: FirstState?
    testRx {
      let presenter = makePresenter(randomViewModel: viewModel)

      presenter.state.subscribe(onNext: { state in
        assertState = state
      }).disposed(by: disposeBag)

      callAsync {
        presenter.startRandom()
      }
    }

    waitForExpectations(timeout: 5)
    XCTAssertEqual(assertState, .random(viewModel: viewModel))
  }

  func testSetRandomGifWhenFailed() throws {
    var assertState: FirstState?
    let presenter = makePresenter()
    testRx {

      presenter.state.subscribe(onNext: { state in
        assertState = state
      }).disposed(by: disposeBag)

      callAsync {
        presenter.startRandom()
      }
    }

    waitForExpectations(timeout: 5)
    XCTAssertNil(assertState)
  }

  /// Search Tests
  func testSearch() throws {
    let viewModels = GIFViewModelStub.array
    var assertState: FirstState?
    testRx {
      let presenter = makePresenter(searchViewModels: viewModels)

      presenter.state.subscribe(onNext: { state in
        assertState = state
      }).disposed(by: disposeBag)

      callAsync {
        presenter.search(input: self.whatever)
      }
    }

    waitForExpectations(timeout: 5)
    XCTAssertEqual(assertState, .search(viewModels: viewModels))
  }

  func testSearchEmpty() throws {
    var assertState: FirstState?
    testRx {
      let presenter = makePresenter()

      presenter.state.subscribe(onNext: { state in
        assertState = state
      }).disposed(by: disposeBag)

      callAsync {
        presenter.search(input: self.whatever)
      }
    }

    waitForExpectations(timeout: 5)
    XCTAssertEqual(assertState, .search(viewModels: []))
  }

  func testDidSearchCancel() throws {
    let randomViewModel = GIFViewModelStub.regular
    let viewModels = GIFViewModelStub.array
    var assertState: FirstState?
    testRx {
      let presenter = makePresenter(randomViewModel: randomViewModel, searchViewModels: viewModels)

      presenter.state.subscribe(onNext: { state in
        assertState = state
      }).disposed(by: disposeBag)

      callAsync {
        presenter.search(input: self.whatever)
      }

      callAsync {
        presenter.searchDidCancel()
      }
    }

    waitForExpectations(timeout: 5)
    XCTAssertEqual(assertState, .random(viewModel: randomViewModel))
  }

  func testSearchDidSelect() {
    let selectedViewModel = GIFViewModelStub.regular
    let delegate = FakeFirstPresenterDelegate()
    let presenter = makePresenter(delegate: delegate)

    presenter.searchDidSelect(gif: selectedViewModel)

    XCTAssertEqual(delegate.selectedViewModel, selectedViewModel)
  }
}

private extension FirstPresenterTest {
  func makePresenter(
    randomViewModel: GIFViewModel? = nil,
    searchViewModels: [GIFViewModel] = [],
    timeToNextGif: TimeInterval? = nil,
    delegate: FirstPresenterDelegate? = nil
  ) -> FirstPresenter {
    let randomInteractor = FakeRandomInteractor(viewModel: randomViewModel)
    let searchInterator = FakeSearchInteractor(viewModels: searchViewModels)
    let presenter = FirstPresenter(
      randomInteractor: randomInteractor,
      searchInteractor: searchInterator,
      randomGifDuration: timeToNextGif
    )
    presenter.delegate = delegate

    return presenter
  }

  func testRx(delay: TimeInterval = .zero, _ test: () -> Void) {
    let expectation = expectation(description: "test")

    test()

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1 + delay, execute: {
        expectation.fulfill()
    })
  }
}
