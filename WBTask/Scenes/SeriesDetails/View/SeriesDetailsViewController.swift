//
//  SeriesDetailsViewController.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SeriesDetailsDisplayable: LoadingDisplayable, AlertDisplayable {
  func displaySeriesDetails(viewModel: SeriesDetailsViewModel)
}

final class SeriesDetailsViewController: UIViewController {

  var interactor: SeriesDetailsInteractable?


  // MARK: Init

  init(series: Series) {
    super.init(nibName: nil, bundle: nil)

    setupScene()

    interactor?.series = series
  }

  // MARK: Object lifecycle

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupScene()
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()

    interactor?.fetchSeriesDetails()
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = SeriesDetailsPresenter()
    let interactor = SeriesDetailsInteractor(presenter: presenter)
    viewController.interactor = interactor
    presenter.viewController = viewController
  }

  private func setupUI() {
    view.backgroundColor = StyleProvider.backgroundColor  }
}

extension SeriesDetailsViewController: SeriesDetailsDisplayable {

  func displaySeriesDetails(viewModel: SeriesDetailsViewModel) {
  }
}
