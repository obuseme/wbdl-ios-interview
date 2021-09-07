//
//  SeriesDetailsInteractor.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol SeriesDetailsInteractable {
  var series: Series? { get set }
  var characters: [SeriesCharacter]? { get set }
  var comics: [Comics]? { get set }

  func fetchSeriesDetails()
}

final class SeriesDetailsInteractor: SeriesDetailsInteractable {

  // MARK: Properties

  private var presenter: SeriesDetailsPresentable
  private var worker: SeriesDetailsWorkable

  var series: Series?
  var characters: [SeriesCharacter]?
  var comics: [Comics]?

  private var error: NetworkError?

  // MARK: Init

init(presenter: SeriesDetailsPresentable, worker: SeriesDetailsWorkable = SeriesDetailsWorker()) {
  self.presenter = presenter
  self.worker = worker
  }

  // MARK: SeriesDetailsInteractable

  func fetchSeriesDetails() {
    guard let seriesId = series?.id else {
      return
    }

    presenter.presentLoading()

    let group = DispatchGroup()

    // fetching Characters
    group.enter()
    worker.fetchCharacters(for: seriesId) { [weak self] response in
      switch response {
      case .success(let seriesCharacters):
        self?.characters = seriesCharacters.data.results
      case .failure(let error):
        self?.error = error
      }
      group.leave()
    }

    // fetching Comics
    group.enter()
    worker.fetchComics(for: seriesId) { [weak self] response in
      switch response {
      case .success(let seriesComics):
        self?.comics = seriesComics.data.results
      case .failure(let error):
        self?.error = error
      }
      group.leave()
    }

    group.notify(queue: .main) {
      self.presenter.dismissLoading()

      if let error = self.error {
        self.presenter.presentAlert(title: "Error", message: error.description)
        self.error = nil
      } else {
        self.presenter.presentSeriesDetails()
      }
    }
  }
}
