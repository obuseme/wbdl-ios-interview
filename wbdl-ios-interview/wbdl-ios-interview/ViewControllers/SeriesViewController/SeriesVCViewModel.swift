//
//  SeriesVCViewModel.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

final class SeriesVCViewModel {

    @Published var comicSeriesList: [Series] = []
    @Published var errorMessage: String = ""
    
    func fetchComicSeries() {
        Task {
            do {
                // used for paging
                let offset = comicSeriesList.count
                let newSeries = try await ComicFetcher.shared.fetchSeries(offset: offset, limit: 10)
                // remove duplicate items, the api for some reason returns duplicate items
                comicSeriesList += newSeries.filter { !comicSeriesList.contains($0) }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
