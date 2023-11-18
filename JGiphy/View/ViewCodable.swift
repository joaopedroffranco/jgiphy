//
//  ViewCodable.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 08.09.23.
//

protocol ViewCodable {
  func buildViewHierarchy()
  func setupConstraints()
  func configureViews()
  func setupView()
}

extension ViewCodable {
  func setupView() {
    buildViewHierarchy()
    setupConstraints()
    configureViews()
  }
}
