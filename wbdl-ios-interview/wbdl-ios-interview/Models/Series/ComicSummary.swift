//
//  ComicSummary.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct ComicSummary: Decodable {
    let name: String
    let resourceURI: String
}

extension ComicSummary: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: ComicSummary, rhs: ComicSummary) -> Bool {
        return lhs.name == rhs.name
    }
}
