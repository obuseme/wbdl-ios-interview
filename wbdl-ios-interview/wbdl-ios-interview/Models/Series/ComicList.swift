//
//  ComicList.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct ComicList: Decodable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [ComicSummary]
}
