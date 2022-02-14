//
//  ComicCharacter.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

struct `ComicCharacterData`: Codable {
  let results: [ComicCharacter]
}

struct ComicCharacterJSONPayload: Codable {
  let data: `ComicCharacterData`
}

struct ComicCharacter: Codable {
  let name: String?
  let description: String?
}
