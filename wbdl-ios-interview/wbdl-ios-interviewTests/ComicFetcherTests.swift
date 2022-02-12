//
//  ComicFetcherTests.swift
//  wbdl-ios-interviewTests
//
//  Created by Tadreik Campbell on 2/11/22.
//

import XCTest
@testable import wbdl_ios_interview


class ComicFetcherTests: XCTestCase {
    
    var fetcher: ComicFetcher!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        fetcher = ComicFetcher.shared
    }
    
    override func tearDownWithError() throws {
        fetcher = nil
        try super.tearDownWithError()
    }
    
    // For these tests to pass:
    // 1. Given this URL, always return a status ok 200,
    //    otherwise something in the API changed.
    func testAPIAccess() async throws {
        var comp = fetcher.components
        comp.path = "/v1/public/series"
        let request = URLRequest(url: comp.url!)
        let (_, response) = try await URLSession.shared.data(for: request, delegate: nil)
        XCTAssert((response as! HTTPURLResponse).statusCode == 200)
    }
    
}
