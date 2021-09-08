//
//  SeriesDetailsViewModel.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import Foundation

enum SeriesDetailsSectionType {
  case poster(thumbnail: Thumbnail)
  case title(label: String, title: String?)
  case character(character: SeriesCharacter)
  case comics(comics: [Comics])
}

struct SeriesDetailsViewModel {
  let sections: [SeriesDetailsSectionType]

  init(series: Series, characters: [SeriesCharacter]?, comics: [Comics]?) {
    var viewTypes: [SeriesDetailsSectionType] = []

    // poster cell
    viewTypes.append(.poster(thumbnail: series.thumbnail))
    // series title cell
    viewTypes.append(.title(label: "NAME", title: series.title))
    // character cells
    if let characters = characters, !characters.isEmpty {
      viewTypes.append(.title(label: "CHARACTERS", title: nil))
      for character in characters {
        viewTypes.append(.character(character: character))
      }
    }
    // comics cells
    if let comics = comics, !comics.isEmpty {
      viewTypes.append(.title(label: "COMICS", title: nil))
      viewTypes.append(.comics(comics: comics))
    }

    self.sections = viewTypes
  }
}
