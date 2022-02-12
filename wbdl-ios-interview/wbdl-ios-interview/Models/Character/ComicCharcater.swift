//
//  ComicCharcater.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct ComicCharacter: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: MarvelImage
}
