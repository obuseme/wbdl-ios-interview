//
//  HomeSeriesService.swift
//  WBTask
//
//  Created by Ugur on 05/09/2021.
//

import Foundation

protocol HomeSeriesServiceProtocol {
  func fetchComics(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void)
}

final class HomeSeriesService: HomeSeriesServiceProtocol {

  private let networkProvider: NetworkProviderProtocol

  init(networkProvider: NetworkProviderProtocol = NetworkProvider()) {
    self.networkProvider = networkProvider
  }

  func fetchComics(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void) {
    let request = HomeSeriesRequest.series

    networkProvider.performRequest(request) { result in
      completion(result)
    }
  }
}
