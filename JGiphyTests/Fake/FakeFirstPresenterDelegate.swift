//
//  FakeFirstPresenterDelegate.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 11.09.23.
//

import Foundation
@testable import JGiphy

class FakeFirstPresenterDelegate: FirstPresenterDelegate {
  var selectedViewModel: GIFViewModel?

  func didSelect(gif: GIFViewModel) {
    selectedViewModel = gif
  }
}
