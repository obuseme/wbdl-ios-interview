//
//  HomeSeriesRouter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.

import UIKit

protocol HomeSeriesRoutable {
  func navigateToComicsDetails(destination: ComicsDetailsViewController)
}

class HomeSeriesRouter: HomeSeriesRoutable {
  weak var viewController: HomeSeriesViewController?

  // MARK: HomeSeriesRoutable

  func navigateToComicsDetails(destination: ComicsDetailsViewController) {
    viewController?.navigationController?.pushViewController(destination, animated: true)
  }
}
