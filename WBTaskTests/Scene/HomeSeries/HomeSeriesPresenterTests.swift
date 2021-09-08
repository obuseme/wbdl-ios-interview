//
//  HomeSeriesPresenterTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
// swiftlint:disable force_unwrapping
final class HomeSeriesPresenterTests: XCTestCase {

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

  func testHomeSeriesCalledByPresenter() {
    // Given
    let viewControllerSpy = HomeSeriesViewControllerSpy()
    let sut = HomeSeriesPresenter()
    sut.viewController = viewControllerSpy

    let homeSeries = BaseTestCase.getHomeSeries()!

    // When
    sut.presentHomeSeries(for: homeSeries.data.results)
    // Then
    XCTAssert(viewControllerSpy.displayHomeSeriesCalled, "presentHomeSeries() should ask the view controller to display series list")
  }

  func testDisplayLoadingCalledByPresenter() {
    // Given
    let viewControllerSpy = HomeSeriesViewControllerSpy()
    let sut = HomeSeriesPresenter()
    sut.viewController = viewControllerSpy

    // When
    sut.presentLoading()
    // ThenpresentLoading    XCTAssert(viewControllerSpy.displayLoadingCalled, "presentMovieDetail() should ask the view controller to display loading")
  }

  func testDismissLoadingCalledByPresenter() {
    // Given
    let viewControllerSpy = HomeSeriesViewControllerSpy()
    let sut = HomeSeriesPresenter()
    sut.viewController = viewControllerSpy

    // When
    sut.dismissLoading()
    // Then
    XCTAssert(viewControllerSpy.dismissLoadingCalled, "dismissLoading() should ask the view controller to dismiss loading")
  }

  func testDisplayAlertCalledByPresenter() {
    // Given
    let viewControllerSpy = HomeSeriesViewControllerSpy()
    let sut = HomeSeriesPresenter()
    sut.viewController = viewControllerSpy

    // When
    sut.presentAlert(title: "Test Title", message: "Test Message")
    // Then
    XCTAssert(viewControllerSpy.displayAlertCalled, "presentAlert() should ask the view controller to display alert")
  }
}
