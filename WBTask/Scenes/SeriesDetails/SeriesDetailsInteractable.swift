//
//  SeriesDetailsInteractor.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol SeriesDetailsInteractable {
  var series: Series? { get set }

  func fetchSeriesDetails()
}

final class SeriesDetailsInteractor: SeriesDetailsInteractable {

  // MARK: Properties

  private var presenter: SeriesDetailsPresentable
  private var worker: SeriesDetailsWorkable

  var series: Series?

  // MARK: Init

init(presenter: SeriesDetailsPresentable, worker: SeriesDetailsWorkable = SeriesDetailsWorker()) {
  self.presenter = presenter
  self.worker = worker
  }

  // MARK: SeriesDetailsInteractable

  func fetchSeriesDetails() {
    // Perform network requests here and present afterwards
  }
}
