//
//  HomeComicsWorker.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeComicsWorkable {
  func fetchComics(completion: @escaping (Result<HomeComics, NetworkError>) -> Void)
}

final class HomeComicsWorker: HomeComicsWorkable {

  private let service: HomeComicsServiceProtocol

  init(service: HomeComicsServiceProtocol = HomeComicsService()) {
    self.service = service
  }

  // MARK: HomeComicsWorkable

  func fetchComics(completion: @escaping (Result<HomeComics, NetworkError>) -> Void) {
    return service.fetchComics(completion: completion)
  }
}
