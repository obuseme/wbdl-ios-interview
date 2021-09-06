//
//  HomeComicsViewController.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeComicsDisplayable: UIViewController {
  func displayHomeComics()
}

final class HomeComicsViewController: UIViewController, HomeComicsDisplayable {

  var interactor: HomeComicsInteractable?
  var router: HomeComicsRouter?

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupScene()
    setupUI()
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = HomeComicsPresenter()
    let interactor = HomeComicsInteractor(presenter: presenter)
    let router = HomeComicsRouter()
    viewController.interactor = interactor
    viewController.router = router
    presenter.viewController = viewController
    router.viewController = viewController
  }

  private func setupUI() {

  }

  private func setupAccessibilityIdentifers() {

  }

  // MARK: HomeComicsDisplayable

  func displayHomeComics() {
  }
}
