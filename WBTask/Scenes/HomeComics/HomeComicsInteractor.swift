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

    worker.fetchComics { [weak self] response in
      switch response {
      case .success(let comics):
        self?.presenter.presentHomeComics(for: comics.data.results)
      case .failure(let error):
        print("error")
      }
    }
  }
}
