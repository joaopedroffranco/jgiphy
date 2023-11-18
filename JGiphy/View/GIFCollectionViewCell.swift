//
//  GIFCollectionViewCell.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

class GIFCollectionViewCell: UICollectionViewCell {
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .lightGray
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func set(image: URL?) {
    imageView.kf.setImage(with: image, options: [.memoryCacheExpiration(.expired), .diskCacheExpiration(.expired)])
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
  }
}

extension GIFCollectionViewCell: ViewCodable {
  func buildViewHierarchy() {
    addSubview(imageView)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  func configureViews() {}
}


