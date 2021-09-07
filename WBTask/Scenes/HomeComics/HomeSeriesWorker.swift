//
//  HomeSeriesWorker.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

protocol HomeSeriesWorkable {
  func fetchSeries(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void)
}

final class HomeSeriesWorker: HomeSeriesWorkable {

  private let service: HomeSeriesServiceProtocol

  init(service: HomeSeriesServiceProtocol = HomeSeriesService()) {
    self.service = service
  }

  // MARK: HomeSeriesWorkable

  func fetchSeries(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void) {
    return service.fetchComics(completion: completion)
  }
}
