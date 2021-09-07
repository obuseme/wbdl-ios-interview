//
//  SeriesDetailsPresenter.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol SeriesDetailsPresentable {
  func presentSeriesDetails()
}

class SeriesDetailsPresenter: SeriesDetailsPresentable {

  weak var viewController: SeriesDetailsDisplayable?

  // MARK: SeriesDetailsPresentable

  func presentSeriesDetails() {
  }
}
