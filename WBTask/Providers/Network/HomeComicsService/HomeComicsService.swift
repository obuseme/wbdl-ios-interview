//
//  HomeComicsService.swift
//  WBTask
//
//  Created by Ugur on 05/09/2021.
//

import Foundation

protocol HomeComicsServiceProtocol {
  func fetchComics(completion: @escaping (Result<HomeComics, NetworkError>) -> Void)
}

final class HomeComicsService: HomeComicsServiceProtocol {

  private let networkProvider: NetworkProviderProtocol

  init(networkProvider: NetworkProviderProtocol = NetworkProvider()) {
    self.networkProvider = networkProvider
  }

  func fetchComics(completion: @escaping (Result<HomeComics, NetworkError>) -> Void) {
    let request = HomeComicsRequest.comics

    networkProvider.performRequest(request) { result in
      completion(result)
    }
  }
}
