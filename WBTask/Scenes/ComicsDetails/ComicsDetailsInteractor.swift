//
//  ComicsDetailsInteractor.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol ComicsDetailsInteractable {
  var comics: Comics? { get set }

  func fetchComicsDetails()
}

final class ComicsDetailsInteractor: ComicsDetailsInteractable {

  // MARK: Properties

  private var presenter: ComicsDetailsPresentable
  private var worker: ComicsDetailsWorkable

  var comics: Comics?

  // MARK: Init

init(presenter: ComicsDetailsPresentable, worker: ComicsDetailsWorkable = ComicsDetailsWorker()) {
  self.presenter = presenter
  self.worker = worker
  }

  // MARK: ComicsDetailsInteractable

  func fetchComicsDetails() {
    // Perform network requests here and present afterwards
  }
}
