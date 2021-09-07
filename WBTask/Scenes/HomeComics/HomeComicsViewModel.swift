//
//  HomeComicsViewModel.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

struct HomeComicsViewModel {
  let id: Int
  let title: String
  let issueNumber: String
  let dates: String?
  let thumbnailURL: URL?

  init(comics: Comics) {
    id = comics.id
    title = comics.title
    issueNumber = "\(comics.issueNumber)"

    let startDate = comics.dates.first { date in
      return date.type == .focDate
    }
    let endDate = comics.dates.first { date in
      return date.type == .onsaleDate
    }
    dates = "\(Date.isoDateToNumberedDateString(isoDate: startDate?.date)) - \(Date.isoDateToNumberedDateString(isoDate: endDate?.date))"

    thumbnailURL = comics.thumbnail.url
  }
}
