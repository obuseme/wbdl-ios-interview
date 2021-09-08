//
//  HomeSeriesViewControllerTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

@testable import WBTask
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
// swiftlint:disable force_unwrapping
final class HomeSeriesViewControllerTests: XCTestCase {

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

  class TableViewSpy: UITableView {
    var reloadDataCalled = false

    override func reloadData() {
      reloadDataCalled = true
    }
  }


  // MARK: Tests

  func testShouldFetchSeriesWhenViewDidLoad() {
    // Given
    let interactor = HomeSeriesInteractorSpy()
    sut.interactor = interactor

    // When
    sut.viewDidLoad()

    // Then
    XCTAssert(interactor.fetchHomeSeriesCalled, "Should series list when view is loaded")
  }

  func testShouldDisplayFetchedSeies() {
    // Given
    let tableViewSpy = TableViewSpy()
    sut.tableView = tableViewSpy

    let series = BaseTestCase.getHomeSeries()!.data.results

    // When
    sut.displayHomeSeries(viewModel: series)

    // Then
    DispatchQueue.main.async {
      XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched series list should reload the table view")
    }
  }

  func testNumberOfRowsInTeaserSectionToDisplay() {
    // Given
    let tableViewSpy = TableViewSpy()
    sut.tableView = tableViewSpy

    let series = BaseTestCase.getHomeSeries()!.data.results

    // When
    sut.displayHomeSeries(viewModel: series)
    let numberOfRows = sut.tableView(tableViewSpy, numberOfRowsInSection: 1)

    // Then
    XCTAssertEqual(numberOfRows, series.count, "The number of tableview rows should equal the number of series list to display")
  }
}
