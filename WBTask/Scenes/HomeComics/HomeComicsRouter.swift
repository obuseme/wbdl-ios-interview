//
//  HomeComicsRouter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.

import UIKit

protocol HomeComicsRoutable {
  func navigateToComicsDetails(destination: ComicsDetailsViewController)
}

class HomeComicsRouter: HomeComicsRoutable {
  weak var viewController: HomeComicsViewController?

  // MARK: HomeComicsRoutable

  func navigateToComicsDetails(destination: ComicsDetailsViewController) {
    viewController?.navigationController?.pushViewController(destination, animated: true)
  }
}
