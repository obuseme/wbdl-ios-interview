//
//  ComicsDetailsPresenter.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol ComicsDetailsPresentable {
  func presentComicsDetails()
}

class ComicsDetailsPresenter: ComicsDetailsPresentable {

  weak var viewController: ComicsDetailsDisplayable?

  // MARK: ComicsDetailsPresentable

  func presentComicsDetails() {
  }
}
