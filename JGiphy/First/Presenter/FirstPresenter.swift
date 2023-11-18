//
//  RandomViewModel.swift
//  JGiphy
//
//  Created by João Pedro Fabiano Franco on 09.09.23.
//

import Foundation
import RxSwift

protocol FirstPresentable: AnyObject {
  var state: PublishSubject<FirstState> { get }

  func startRandom()
  func search(input: String)
  func searchDidCancel()
  func searchDidSelect(gif: GIFViewModel)
}

protocol FirstPresenterDelegate: AnyObject {
  func didSelect(gif: GIFViewModel)
}

class FirstPresenter: FirstPresentable {
  var state: PublishSubject<FirstState> = .init()

  /// Random Feature Properties
  private var randomGifDuration: TimeInterval?
  private let randomInteractor: RandomInteractable
  private var currentRandomTask: Task<Void, Never>?
  private var randomTimer: Timer?

  /// Search Feature Properties
  private let searchInteractor: SearchInteractable
  private var currentSearchTask: Task<Void, Never>?

  weak var delegate: FirstPresenterDelegate?

  init(
    randomInteractor: RandomInteractable = RandomInteractor(),
    searchInteractor: SearchInteractable = SearchInteractor(),
    randomGifDuration: TimeInterval? = 10
  ) {
    self.randomInteractor = randomInteractor
    self.searchInteractor = searchInteractor
    self.randomGifDuration = randomGifDuration
  }

  deinit {
    randomTimer?.invalidate()
    randomTimer = nil
    currentRandomTask?.cancel()
    currentRandomTask = nil
    currentSearchTask?.cancel()
    currentSearchTask = nil
  }
}

// MARK: - Random Feature
extension FirstPresenter {
  func startRandom() {
    setRandomGif()
  }

  private func setRandomGif() {
    if let randomGifDuration {
      randomTimer = Timer.scheduledTimer(
        withTimeInterval: randomGifDuration,
        repeats: false,
        block: { [weak self] _ in self?.setRandomGif() }
      )
    }

    currentRandomTask?.cancel()
    currentRandomTask = Task {
      guard let randomViewModel = await randomInteractor.getRandomViewModel() else {
        return
      }
      state.onNext(.random(viewModel: randomViewModel))
    }
  }
}

// MARK: - Search Feature
extension FirstPresenter {
  func search(input: String) {
    randomTimer?.invalidate()
    currentRandomTask?.cancel()
    currentSearchTask?.cancel()
    currentSearchTask = Task {
      let searchViewModels = await searchInteractor.get(input: input)
      state.onNext(.search(viewModels: searchViewModels))
    }
  }

  func searchDidCancel() {
    startRandom()
  }

  func searchDidSelect(gif: GIFViewModel) {
    delegate?.didSelect(gif: gif)
  }
}
