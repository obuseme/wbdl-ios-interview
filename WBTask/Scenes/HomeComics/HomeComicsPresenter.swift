//
//  HomeComicsPresenter.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeComicsPresentable {
  func presentHomeComics()
}

final class HomeComicsPresenter: HomeComicsPresentable {

  weak var viewController: HomeComicsDisplayable?

  // MARK: HomeComicsPresentable

  func presentHomeComics() {
  }
}
