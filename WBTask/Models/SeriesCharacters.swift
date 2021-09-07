//
//  SeriesCharacters.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation


struct SeriesCharacters: Codable {
  let data: CharactersResponse
}

struct CharactersResponse: Codable {
  let results: [SeriesCharacter]
}

struct SeriesCharacter: Codable {
  let id: Int
  let name: String
  let description: String
  let thumbnail: Thumbnail
}
