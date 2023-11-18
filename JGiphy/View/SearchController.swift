//
//  SearchController.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 10.09.23.
//

import UIKit

protocol SearchControllerDelegate: AnyObject {
  func didChange(text: String)
  func didCancel()
}

class SearchController: UISearchController {

  var placeholder: String {
    didSet {
      searchBar.placeholder = placeholder
    }
  }

  var searchDelegate: SearchControllerDelegate?

  init(placeholder: String) {
    self.placeholder = placeholder
    super.init(nibName: nil, bundle: nil)
    searchBar.delegate = self
    searchBar.tintColor = .black
    searchBar.placeholder = placeholder
  }

  func add(on parentController: UIViewController) {
    parentController.navigationItem.searchController = self
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SearchController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.count > 1 {
      searchDelegate?.didChange(text: searchText)
    }
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchDelegate?.didCancel()
  }

}
