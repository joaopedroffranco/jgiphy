//
//  XCTestCase+Extension.swift
//  JGiphyTests
//
//  Created by João Pedro Fabiano Franco on 10.09.23.
//

import XCTest

extension XCTestCase {
  func callAsync(_ method: @escaping () async -> Void) {
    let expectation = expectation(description: "async_method")
    Task {
      await method()
      expectation.fulfill()
    }
  }
}
