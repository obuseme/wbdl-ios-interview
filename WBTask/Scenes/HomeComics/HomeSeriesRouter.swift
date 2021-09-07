//
//  HomeSeriesRouter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.

import UIKit

protocol HomeSeriesRoutable {
  func navigateToSeriesDetails(destination: SeriesDetailsViewController)
}

class HomeSeriesRouter: HomeSeriesRoutable {
  weak var viewController: HomeSeriesViewController?

  // MARK: HomeSeriesRoutable

  func navigateToSeriesDetails(destination: SeriesDetailsViewController) {
    viewController?.navigationController?.pushViewController(destination, animated: true)
  }
}
