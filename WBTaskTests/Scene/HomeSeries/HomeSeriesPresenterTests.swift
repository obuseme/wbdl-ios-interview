//
//  HomeSeriesPresenterTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
class HomeSeriesPresenterTests: XCTestCase {

  // MARK: Subject under test

  var sut: HomeSeriesPresenter!

  // MARK: Test lifecycle

  override func setUp() {
    super.setUp()

    sut = HomeSeriesPresenter()
  }

  // MARK: Test doubles

  class HomeSeriesViewControllerSpy: UIViewController, HomeSeriesDisplayable {

    var displayHomeSeriesCalled = false
    var displayLoadingCalled = false
    var dismissLoadingCalled = false
    var displayAlertCalled = false

    func displayHomeSeries(viewModel: [Series]) {
      displayHomeSeriesCalled = true
    }

    func displayLoading() {
      displayLoadingCalled = true
    }

    func dismissLoading() {
      dismissLoadingCalled = true
    }

    func displayAlert(title: String, message: String) {
      displayAlertCalled = true
    }
  }

  // MARK: Tests

}
