//
//  HomeSeriesViewControllerTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
class HomeSeriesViewControllerTests: XCTestCase {

  // MARK: Subject under test

  var sut: HomeSeriesViewController!

  // MARK: Test lifecycle

  override func setUp() {
    super.setUp()

    sut = HomeSeriesViewController()
    sut.beginAppearanceTransition(true, animated: false)
    sut.endAppearanceTransition()
  }

  // MARK: Test doubles

  class HomeSeriesInteractorSpy: HomeSeriesInteractable {

    var fetchHomeSeriesCalled = false

    var series: [Series]?

    func fetchHomeSeries() {
      fetchHomeSeriesCalled = true
    }
  }

  // MARK: Tests
}
