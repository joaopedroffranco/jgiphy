//
//  FakeFirstPresenter.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 10.09.23.
//

import Foundation
import RxSwift
@testable import JGiphy

class FakeFirstPresenter: FirstPresentable {
  let state = PublishSubject<FirstState>()
  var selectedViewModel: GIFViewModel?

  func startRandom() {
    state.onNext(.random(viewModel: GIFViewModelStub.regular))
  }

  func search(input: String) {
    state.onNext(.search(viewModels: GIFViewModelStub.array))
  }

  func searchDidCancel() {
    state.onNext(.random(viewModel: GIFViewModelStub.regular))
  }

  func searchDidSelect(gif: GIFViewModel) {
    selectedViewModel = gif
  }
}
