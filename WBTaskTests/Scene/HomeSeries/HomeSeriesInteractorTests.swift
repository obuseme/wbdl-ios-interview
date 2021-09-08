//
//  HomeSeriesInteractorTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
class HomeSeriesInteractorTests: XCTestCase {

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

  // MARK: Tests

}
