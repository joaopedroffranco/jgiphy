//
//  DetailPresenter.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 11.09.23.
//

import Foundation

protocol DetailPresentable: AnyObject {
  var viewModel: GIFViewModel { get }
}

class DetailPresenter: DetailPresentable {
  let viewModel: GIFViewModel

  init(viewModel: GIFViewModel) {
    self.viewModel = viewModel
  }
}
