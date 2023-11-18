//
//  GIFModelTests.swift
//  GIFModelTests
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import XCTest
@testable import JGiphy

final class RandomResponseTests: XCTestCase {
  func testDecode() {
    guard
      let data = FileRepository().get(file: .random),
      let response = try? JSONDecoder().decode(RandomResponse.self, from: data)
    else {
      return XCTFail("Couldn't decode")
    }

    let gifModel = response.gif

    XCTAssertEqual(gifModel.id, "l0He3WWw0tZvAbMek")
    XCTAssertEqual(gifModel.title, "the grammys GIF by Recording Academy / GRAMMYs")
    XCTAssertEqual(gifModel.rating, "g")

    let assertMedia = MediaModel(
      url: "https://media0.giphy.com/media/l0He3WWw0tZvAbMek/200w.gif?cid=e7e7d8071dmmaca4hvgvnl2minp3r5wjq85tnkx2esj4atts&ep=v1_gifs_random&rid=200w.gif&ct=g",
      width: "200",
      height: "98"
    )
    XCTAssertEqual(gifModel.media, assertMedia)

    let assertStaticMedia = MediaModel(
      url: "https://media0.giphy.com/media/l0He3WWw0tZvAbMek/200w_s.gif?cid=e7e7d8071dmmaca4hvgvnl2minp3r5wjq85tnkx2esj4atts&ep=v1_gifs_random&rid=200w_s.gif&ct=g",
      width: "200",
      height: "98"
    )
    XCTAssertEqual(gifModel.staticMedia, assertStaticMedia)
  }
}
