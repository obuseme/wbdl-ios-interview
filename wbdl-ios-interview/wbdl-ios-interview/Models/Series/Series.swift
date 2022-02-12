//
//  Series.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct Series: Decodable {
    let id: Int
    let title: String
    let thumbnail: MarvelImage
    let startYear: Int
    let endYear: Int
    let comics: ComicList
}

extension Series: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Series, rhs: Series) -> Bool {
        return lhs.id == rhs.id
    }
}
