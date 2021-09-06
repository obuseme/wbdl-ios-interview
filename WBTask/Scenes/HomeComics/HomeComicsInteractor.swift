//
//  HomeComicsInteractor.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeComicsInteractable {
  func fetchHomeComics()
}

final class HomeComicsInteractor: HomeComicsInteractable {

  // MARK: Properties

  private var presenter: HomeComicsPresentable
  private var worker: HomeComicsWorkable

  // MARK: Init

  init(presenter: HomeComicsPresentable, worker: HomeComicsWorkable = HomeComicsWorker()) {
    self.presenter = presenter
    self.worker = worker
  }

  // MARK: HomeComicsInteractable

  func fetchHomeComics() {
    // Perform network requests here and present afterwards
  }
}
