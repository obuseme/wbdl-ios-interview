//
//  SeriesDetailsViewModel.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import Foundation

enum SeriesDetailsSectionType {
  case poster(thumbnail: Thumbnail)
  case title(title: String)
  case characters(characters: [SeriesCharacter])
  case comics(comics: [Comics])
}

struct SeriesDetailsViewModel {
  let sections: [SeriesDetailsSectionType]

  init(series: Series, characters: [SeriesCharacter]?, comics: [Comics]?) {
    var viewTypes: [SeriesDetailsSectionType] = []

    viewTypes.append(.poster(thumbnail: series.thumbnail))
    viewTypes.append(.title(title: series.title))
    if let characters = characters {
      viewTypes.append(.characters(characters: characters))
    }
    if let comics = comics {
      viewTypes.append(.comics(comics: comics))
    }

    self.sections = viewTypes
  }
}
