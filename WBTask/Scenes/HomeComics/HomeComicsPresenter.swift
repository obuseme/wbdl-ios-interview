//
//  HomeSeriesPresenter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeSeriesPresentable: LoadingPresentable, AlertPresentable {
  func presentHomeSeries(for series: [Series])
}

final class HomeSeriesPresenter: HomeSeriesPresentable {

  weak var viewController: HomeSeriesDisplayable?

  // MARK: HomeSeriesPresentable

  func presentHomeSeries(for series: [Series]) {
    viewController?.displayHomeSeries(viewModel: series)
  }

  // MARK: LoadingPresentable

  func presentLoading() {
    viewController?.displayLoading()
  }

  func dismissLoading() {
    viewController?.dismissLoading()
  }

  // MARK: AlertPresentable

  func presentAlert(title: String, message: String) {
    viewController?.displayAlert(title: title, message: message)
  }
}
