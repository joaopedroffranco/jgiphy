//
//  ViewController.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 07.09.23.
//

import UIKit
import RxSwift

class FirstViewController: UIViewController {

  lazy var searchController: SearchController = {
    let controller = SearchController(placeholder: "Search for gifs around the world")
    controller.searchDelegate = self
    return controller
  }()

  lazy var gifView: GIFView = {
    let view = GIFView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  lazy var searchCollectionView: GIFCollectionView = {
    let collectionView = GIFCollectionView()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.collectionDelegate = self
    return collectionView
  }()

  let presenter: FirstPresentable

  /// Rx properties
  private var disposeBag = DisposeBag()

  init(presenter: FirstPresentable) {
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
    presenter.startRandom()
  }
}

// MARK: - ViewCodable
extension FirstViewController: ViewCodable {
  func buildViewHierarchy() {
    view.addSubview(gifView)
    view.addSubview(searchCollectionView)
    searchController.add(on: self)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      gifView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DesignSystem.screenMargins),
      gifView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DesignSystem.screenMargins),
      gifView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -DesignSystem.screenMargins),
      gifView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DesignSystem.screenMargins),

      searchCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DesignSystem.screenMargins),
      searchCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: DesignSystem.screenMargins),
      searchCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -DesignSystem.screenMargins),
      searchCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DesignSystem.margins),
    ])
  }

  func configureViews() {
    view.backgroundColor = .white
    bindState()
  }

  private func bindState() {
    presenter.state
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: { [weak self] state in self?.handle(state: state) })
      .disposed(by: disposeBag)
  }

  private func handle(state: FirstState) {
    switch state {
    case let .random(viewModel):
      navigationItem.title = "Random GIF"
      gifView.viewModel = viewModel
      gifView.isHidden = false
      searchCollectionView.isHidden = true
    case let .search(viewModels):
      navigationItem.title = "Search results"
      searchCollectionView.viewModels = viewModels
      gifView.isHidden = true
      searchCollectionView.isHidden = false
    }
  }
}

// MARK: - SearchController Delegate
extension FirstViewController: SearchControllerDelegate {
  func didChange(text: String) {
    presenter.search(input: text)
  }

  func didCancel() {
    presenter.searchDidCancel()
  }
}

// MARK: - GIFCollectionView Delegate
extension FirstViewController: GIFCollectionViewDelegate {
  func didSelect(gif: GIFViewModel) {
    presenter.searchDidSelect(gif: gif)
  }
}
