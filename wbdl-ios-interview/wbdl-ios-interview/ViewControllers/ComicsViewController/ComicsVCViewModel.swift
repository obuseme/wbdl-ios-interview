//
//  ComicsVCViewModel.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

final class ComicsVCViewModel {
    
    var isInitialLoad = true
    var seriesID: Int
    var characters: [ComicCharacter] = []
    @Published var isInitialFetchComplete = false
    @Published var comics: [Comic] = []
    @Published var errorMessage: String = ""
    
    init(seriesID: Int) {
        self.seriesID = seriesID
    }
    
    func fetchComics() {
        Task {
            do {
                if isInitialLoad {
                    characters = try await ComicFetcher.shared.fetchCharacters(seriesID: seriesID, limit: 2)
                    isInitialLoad = false
                }
                // this will start once the characters have been fetched
                comics += try await ComicFetcher.shared.fetchComics(offset: comics.count, seriesID: seriesID, limit: 8)
                isInitialFetchComplete = true
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
