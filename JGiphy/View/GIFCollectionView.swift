//
//  SearchCollectionView.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

protocol GIFCollectionViewDelegate: AnyObject {
  func didSelect(gif: GIFViewModel)
}

class GIFCollectionView: UICollectionView {

  var viewModels: [GIFViewModel] = [] {
    didSet {
      reloadData()
    }
  }

  var collectionDelegate: GIFCollectionViewDelegate?

  init() {
    super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    register(GIFCollectionViewCell.self, forCellWithReuseIdentifier: .cellIdentifier)
    dataSource = self
    delegate = self
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func gifViewModelFor(indexPath: IndexPath) -> GIFViewModel? {
    viewModels[safe: indexPath.row]
  }

  private func mediaViewModelFor(indexPath: IndexPath) -> MediaViewModel? {
    gifViewModelFor(indexPath: indexPath)?.imageMedia
  }
}

extension GIFCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModels.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .cellIdentifier, for: indexPath) as? GIFCollectionViewCell,
      let viewModel = mediaViewModelFor(indexPath: indexPath)
    else {
      return UICollectionViewCell()
    }

    cell.set(image: viewModel.url)

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = 100.0
    return CGSize(width: size, height: size)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let viewModel = gifViewModelFor(indexPath: indexPath) else { return }
    collectionDelegate?.didSelect(gif: viewModel)
  }
}

private extension String {
  static let cellIdentifier = "gif_cell"
}
