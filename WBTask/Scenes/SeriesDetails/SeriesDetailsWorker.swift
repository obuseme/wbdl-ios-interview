//
//  SeriesDetailsWorker.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol SeriesDetailsWorkable {
  func fetchCharacters(for seriesId: Int, completion: @escaping (Result<SeriesCharacters, NetworkError>) -> Void)
  func fetchComics(for seriesId: Int, completion: @escaping (Result<SeriesComics, NetworkError>) -> Void)
}

final class SeriesDetailsWorker: SeriesDetailsWorkable {

  private let service: SeriesDetailsServiceProtocol

  init(service: SeriesDetailsServiceProtocol = SeriesDetailsService()) {
    self.service = service
  }

  // MARK: SeriesDetailsWorkable

  func fetchCharacters(for seriesId: Int, completion: @escaping (Result<SeriesCharacters, NetworkError>) -> Void) {
    service.fetchCharacters(for: seriesId, completion: completion)
  }

  func fetchComics(for seriesId: Int, completion: @escaping (Result<SeriesComics, NetworkError>) -> Void) {
    service.fetchComics(for: seriesId, completion: completion)
  }
}
