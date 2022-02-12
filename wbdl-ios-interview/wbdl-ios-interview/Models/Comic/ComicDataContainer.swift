//
//  ComicDataContainer.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct ComicDataContainer: Decodable {
    /// The requested result limit
    let limit: Int
    /// The total number of resources available given the current filter set
    let total: Int
    /// The total number of results returned by this call
    let count: Int
    /// The list of comics returned by the call
    let results: [Comic]
}
