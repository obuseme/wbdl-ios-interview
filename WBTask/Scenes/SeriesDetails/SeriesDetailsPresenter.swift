//
//  SeriesDetailsPresenter.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol SeriesDetailsPresentable: LoadingPresentable, AlertPresentable {
  func presentSeriesDetails(series: Series, characters: [SeriesCharacter]?, comics: [Comics]?)
}

class SeriesDetailsPresenter: SeriesDetailsPresentable {

  weak var viewController: SeriesDetailsDisplayable?

  // MARK: SeriesDetailsPresentable

  func presentSeriesDetails(series: Series, characters: [SeriesCharacter]?, comics: [Comics]?) {
    let viewModel = SeriesDetailsViewModel(series: series, characters: characters, comics: comics)
    viewController?.displaySeriesDetails(viewModel: viewModel)
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
