//
//  DetailViewController.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 11.09.23.
//

import UIKit

class DetailViewController: UIViewController {

  lazy var gifView: GIFView = {
    let view = GIFView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let presenter: DetailPresentable

  init(presenter: DetailPresentable) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    super.loadView()
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = presenter.viewModel.title
  }
}

// MARK: - ViewCodable
extension DetailViewController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubview(gifView)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      gifView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DesignSystem.screenMargins),
      gifView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DesignSystem.screenMargins),
      gifView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -DesignSystem.screenMargins),
      gifView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DesignSystem.screenMargins)
    ])
  }

  func configureViews() {
    view.backgroundColor = .white
    gifView.viewModel = presenter.viewModel
  }
}
