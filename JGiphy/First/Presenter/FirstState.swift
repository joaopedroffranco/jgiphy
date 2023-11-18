//
//  FirstState.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 10.09.23.
//

import Foundation

enum FirstState: Equatable {
  case random(viewModel: GIFViewModel?)
  case search(viewModels: [GIFViewModel])
}
