//
//  Comic.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct Comic: Decodable {
    let id: Int
    let title: String
    let issueNumber: Double
    let thumbnail: MarvelImage
}

extension Comic: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        return lhs.id == rhs.id
    }
}
