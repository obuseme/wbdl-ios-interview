//
//  HomeSeriesInteractor.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeSeriesInteractable {
  var series: [Series]? { get set }

  func fetchHomeSeries()
}

final class HomeSeriesInteractor: HomeSeriesInteractable {

  // MARK: Properties

  private var presenter: HomeSeriesPresentable
  private var worker: HomeSeriesWorkable

  var series: [Series]?

  // MARK: Init

  init(presenter: HomeSeriesPresentable, worker: HomeSeriesWorkable = HomeSeriesWorker()) {
    self.presenter = presenter
    self.worker = worker
  }

  // MARK: HomeSeriesInteractable

  func fetchHomeSeries() {
    presenter.presentLoading()

    worker.fetchComics { [weak self] response in
      switch response {
      case .success(let series):
        self?.series = series.data.results
        self?.presenter.presentHomeSeries(for: series.data.results)
      case .failure(let error):
        self?.presenter.presentAlert(title: "Error", message: error.description)
      }
      self?.presenter.dismissLoading()
    }
  }
}
