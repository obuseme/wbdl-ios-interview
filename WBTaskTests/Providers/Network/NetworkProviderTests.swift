//
//  NetworkProviderTests.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import XCTest
@testable import WBTask

// swiftlint:disable implicitly_unwrapped_optional
final class NetworkProviderTests: XCTestCase {

  private var networkProvider: NetworkProviderMock!
  private var networkRequestMock: NetworkRequestMock!

  override func setUp() {
    super.setUp()

    networkProvider = NetworkProviderMock()
    networkRequestMock = NetworkRequestMock.test
  }

  func testNetworkRequestFailureError() {
    // When
    var isSuccessful = true

    networkProvider.forceFail = true
    networkProvider.forcedError = NetworkError.serverError

    // When
    networkProvider.performRequest(networkRequestMock) { (result: Result<HomeSeries, NetworkError>) in
      if case .failure(.serverError) = result {
        isSuccessful = false
      }
    }
    // Then
    XCTAssertFalse(isSuccessful)
  }

  func testVoidNetworkRequestSuccess() {
    // When
    var isSuccessful = false
    let movie = BaseTestCase.getHomeSeries()
    networkProvider.responseObject = movie

    // When
    networkProvider.performRequest(networkRequestMock) { (result: Result<HomeSeries, NetworkError>) in
      if case .success = result {
        isSuccessful = true
      }
    }
    // Then
    XCTAssertTrue(isSuccessful)
  }
}
