//
//  RandomScreenView.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

import UIKit
import Kingfisher

class GIFView: UIView {

  lazy var gifView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .center
    view.backgroundColor = .lightGray.withAlphaComponent(0.2)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  lazy var columnDescriptionTextStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    return stackView
  }()

  lazy var gifTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = DesignSystem.titleFont
    return label
  }()

  lazy var gifDescLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = DesignSystem.descriptionFont
    return label
  }()

  lazy var ratingLabel: RatingLabel = {
    let label = RatingLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    return label
  }()

  override init(frame: CGRect = UIScreen.main.bounds) {
    super.init(frame: frame)
    setupView()
  }

  var viewModel: GIFViewModel? {
    didSet {
      set(viewModel: viewModel)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func set(viewModel: GIFViewModel?) {
    guard let gifMedia = viewModel?.gifMedia else { return }
    gifView.kf.setImage(
      with: gifMedia.url,
      options: [.memoryCacheExpiration(.expired), .diskCacheExpiration(.expired)]
    )
    gifTitleLabel.text = viewModel?.title
    gifDescLabel.text = viewModel?.description
    ratingLabel.value = viewModel?.rating
  }
}

extension GIFView: ViewCodable {
  func buildViewHierarchy() {
    columnDescriptionTextStack.addArrangedSubview(gifTitleLabel)
    columnDescriptionTextStack.addArrangedSubview(gifDescLabel)

    addSubview(gifView)
    addSubview(columnDescriptionTextStack)
    addSubview(ratingLabel)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      gifView.topAnchor.constraint(equalTo: topAnchor),
      gifView.leadingAnchor.constraint(equalTo: leadingAnchor),
      gifView.trailingAnchor.constraint(equalTo: trailingAnchor),
      gifView.bottomAnchor.constraint(equalTo: columnDescriptionTextStack.topAnchor, constant: -DesignSystem.margins),
      gifView.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -DesignSystem.margins),

      columnDescriptionTextStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      columnDescriptionTextStack.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -DesignSystem.biggerMargins),

      ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  func configureViews() {
    backgroundColor = DesignSystem.screenColor
  }
}
