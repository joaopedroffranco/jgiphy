//
//  RatingView.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import UIKit

class RatingLabel: UILabel {

  private let margin = 10.0

  var value: String? {
    didSet {
      text = value?.uppercased()
    }
  }

  override var intrinsicContentSize: CGSize {
    get {
      var contentSize = super.intrinsicContentSize
     contentSize.height += 2 * margin
     contentSize.width += 2 * margin
     return contentSize
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black.withAlphaComponent(0.8)
    textColor = .white
    layer.masksToBounds = true
    layer.cornerRadius = DesignSystem.radius
  }

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    super.drawText(in: rect.inset(by: insets))
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
