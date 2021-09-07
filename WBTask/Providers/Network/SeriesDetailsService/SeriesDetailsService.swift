//
//  SeriesDetailsService.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

protocol SeriesDetailsServiceProtocol {
  func fetchCharacters(for seriesId: Int, completion: @escaping (Result<SeriesCharacters, NetworkError>) -> Void)
  func fetchComics(for seriesId: Int, completion: @escaping (Result<SeriesComics, NetworkError>) -> Void)
}

final class SeriesDetailsService: SeriesDetailsServiceProtocol {

  private let networkProvider: NetworkProviderProtocol

  init(networkProvider: NetworkProviderProtocol = NetworkProvider()) {
    self.networkProvider = networkProvider
  }

  func fetchCharacters(for seriesId: Int, completion: @escaping (Result<SeriesCharacters, NetworkError>) -> Void) {
    let request = SeriesDetailsRequest.characters(id: seriesId)

    networkProvider.performRequest(request) { result in
      completion(result)
    }
  }

  func fetchComics(for seriesId: Int, completion: @escaping (Result<SeriesComics, NetworkError>) -> Void) {
    let request = SeriesDetailsRequest.comics(id: seriesId)

    networkProvider.performRequest(request) { result in
      completion(result)
    }
  }
}
