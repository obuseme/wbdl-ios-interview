//
//  HomeSeriesInteractorTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
// swiftlint:disable force_unwrapping
final class HomeSeriesInteractorTests: XCTestCase {

  // MARK: Subject under test

  var sut: HomeSeriesInteractor!

  // MARK: Test doubles

  class HomeSeriesPresenterSpy: HomeSeriesPresentable {
    var series: [Series]?

    var presentHomeSeriesCalled = false
    var presentLoadingCalled = false
    var dismissLoadingCalled = false
    var presentAlertCalled = false

    func presentHomeSeries(for series: [Series]) {
      presentHomeSeriesCalled = true
      self.series = series
    }

    func presentLoading() {
      presentLoadingCalled = true
    }

    func dismissLoading() {
      dismissLoadingCalled = true
    }

    func presentAlert(title: String, message: String) {
      presentAlertCalled = true
    }
  }

  class HomeSeriesWorkerSuccessSpy: HomeSeriesWorkable {
    var fetchSeriesCalled = false

    func fetchSeries(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void) {
      fetchSeriesCalled = true
      let homeSeries = BaseTestCase.getHomeSeries()
      completion(.success(homeSeries!))
    }
  }

  class HomeSeriesWorkerErrorSpy: HomeSeriesWorkable {
    var fetchSeriesCalled = false

    func fetchSeries(completion: @escaping (Result<HomeSeries, NetworkError>) -> Void) {
      fetchSeriesCalled = true
      completion(.failure(.serverError))
    }
  }

  // MARK: Tests

  func testFetchMovieDetails() {
    // Given
    let presenter = HomeSeriesPresenterSpy()
    let worker = HomeSeriesWorkerSuccessSpy()
    sut = HomeSeriesInteractor(presenter: presenter, worker: worker)

    // When
    sut.fetchHomeSeries()

    // Then
    XCTAssertTrue(worker.fetchSeriesCalled, "fetchHomeSeries() should ask the worker to fetch the series")
    XCTAssertTrue(presenter.presentLoadingCalled, "fetchHomeSeries() should ask the presenter to present the loading")
    XCTAssertTrue(presenter.presentHomeSeriesCalled, "fetchHomeSeries() should ask the presenter to present series list")
    XCTAssertNotNil(presenter.series, "fetchHomeSeries() should pass HomeSeries object to presenter")
    XCTAssertTrue(presenter.dismissLoadingCalled, "fetchHomeSeries() should ask the presenter to dismiss the loading")
  }

  func testFetchMovieDetailsWithError() {
    // Given
    let presenter = HomeSeriesPresenterSpy()
    let worker = HomeSeriesWorkerErrorSpy()
    sut = HomeSeriesInteractor(presenter: presenter, worker: worker)

    // When
    sut.fetchHomeSeries()

    // Then
    XCTAssertTrue(worker.fetchSeriesCalled, "fetchHomeSeries() should ask the worker to fetch the series")
    XCTAssertTrue(presenter.presentLoadingCalled, "fetchHomeSeries() should ask the presenter to present the loading")
    XCTAssertFalse(presenter.presentHomeSeriesCalled, "fetchHomeSeries() shouldn't ask the presenter to present series list")
    XCTAssertNil(presenter.series, "fetchHomeSeries() shouldn't pass HomeSeries object to presenter")
    XCTAssertTrue(presenter.dismissLoadingCalled, "fetchHomeSeries() should ask the presenter to dismiss the loading")
  }
}
