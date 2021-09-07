//
//  ComicsDetailsViewController.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ComicsDetailsDisplayable: UIViewController {
  func displayComicsDetails()
}

final class ComicsDetailsViewController: UIViewController {

  var interactor: ComicsDetailsInteractable?


  // MARK: Init

  init(comics: Comics) {
    super.init(nibName: nil, bundle: nil)

    setupScene()

    interactor?.comics = comics
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
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = ComicsDetailsPresenter()
    let interactor = ComicsDetailsInteractor(presenter: presenter)
    viewController.interactor = interactor
    presenter.viewController = viewController
  }

  private func setupUI() {
    view.backgroundColor = StyleProvider.backgroundColor  }
}

extension ComicsDetailsViewController: ComicsDetailsDisplayable {

  func displayComicsDetails() {
  }
}
