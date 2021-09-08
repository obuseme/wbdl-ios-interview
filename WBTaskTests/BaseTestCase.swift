//
//  WBTaskTests.swift
//  WBTaskTests
//
//  Created by Ugur on 02/09/2021.
//

import XCTest
@testable import WBTask

class BaseTestCase: XCTestCase {

  static func getHomeSeries() -> HomeSeries? {
    let testBundle = Bundle(for: BaseTestCase.self)
    if let path = testBundle.path(forResource: "homeSeries", ofType: "json") {
      do {
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
          let decoder = JSONDecoder()
          return try? decoder.decode(HomeSeries.self, from: data)
        }
        return nil
      }
    } else {
      print("Couldn't find a .json to mock with with homeSeries.json - Returning nil instead")
      return nil
    }
  }
}
