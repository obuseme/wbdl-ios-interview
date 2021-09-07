//
//  HomeComicsPresenter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeComicsPresentable: LoadingPresentable, AlertPresentable {
  func presentHomeComics(for comics: [Comics])
}

final class HomeComicsPresenter: HomeComicsPresentable {

  weak var viewController: HomeComicsDisplayable?

  // MARK: HomeComicsPresentable

  func presentHomeComics(for comics: [Comics]) {
    let viewmodel: [HomeComicsViewModel] = comics.map { comics in
      return HomeComicsViewModel(comics: comics)
    }
    viewController?.displayHomeComics(viewModel: viewmodel)
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
