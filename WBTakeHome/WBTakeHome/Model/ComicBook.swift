//
//  ComicBook.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

struct ComicBook: Codable {
  let title: String?
  let issueNumber: Double?
  let thumbnail: Thumbnail
}
