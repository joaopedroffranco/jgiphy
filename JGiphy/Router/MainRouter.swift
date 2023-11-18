//
//  MainRouter.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import UIKit

class MainRouter: RouterProtocol {
  let navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    navigationController.navigationBar.tintColor = .black
  }

  func start() {
    let viewController = makeFirstController()
    navigationController.setViewControllers([viewController], animated: false)
  }

  func dismiss() {
    navigationController.setViewControllers([], animated: false)
  }
}

// MARK: - Make Controllers
extension MainRouter {
  func makeFirstController() -> UIViewController {
    let presenter = FirstPresenter()
    let viewController = FirstViewController(presenter: presenter)
    presenter.delegate = self
    return viewController
  }

  func makeDetailController(with selectedViewModel: GIFViewModel) -> UIViewController {
    let presenter = DetailPresenter(viewModel: selectedViewModel)
    let viewController = DetailViewController(presenter: presenter)
    return viewController
  }
}

// MARK: - First Delegate
extension MainRouter: FirstPresenterDelegate {
  func didSelect(gif: GIFViewModel) {
    let viewController = makeDetailController(with: gif)
    navigationController.pushViewController(viewController, animated: true)
  }
}
