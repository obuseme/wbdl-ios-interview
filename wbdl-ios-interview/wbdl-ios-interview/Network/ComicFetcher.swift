//
//  ComicFetcher.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct ComicFetcher {
    
    static let shared = ComicFetcher()
    
    var components: URLComponents {
        let hash = MD5("\(timestamp)\(Const.privateKey)\(Const.publicKey)")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.queryItems = [
            URLQueryItem(name: "ts", value: "\(timestamp)"),
            URLQueryItem(name: "apikey", value: Const.publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        return components
    }
    
    private var timestamp: String {
        String(Int(Date().timeIntervalSince1970))
    }
    
    private init() {}
    
    func fetchSeries(offset: Int, limit: Int = 1) async throws -> [Series] {
        var comp = components
        comp.path = "/v1/public/series"
        let orderItem = URLQueryItem(name: "orderBy", value: "startYear")
        let offsetItem = URLQueryItem(name: "offset", value: "\(offset)")
        let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
        comp.queryItems?.append(contentsOf: [orderItem, limitItem, offsetItem])
        let request = URLRequest(url: comp.url!)
        // Since this is an async function, it's best to use the
        // aync await version of URLSession. Look how clean and simple 1 line.
        // Compare that to the 8+ lines required for escaping closure version
        let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
        let decoder = JSONDecoder()
        let seriesDataWrapper = try decoder.decode(SeriesDataWrapper.self, from: data)
        return seriesDataWrapper.data.results
    }
    
    func fetchCharacters(seriesID: Int, limit: Int = 1) async throws -> [ComicCharacter] {
        var comp = components
        comp.path = "/v1/public/series/\(seriesID)/characters"
        let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
        comp.queryItems?.append(limitItem)
        let request = URLRequest(url: comp.url!)
        let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
        let decoder = JSONDecoder()
        let charDataWrapper = try decoder.decode(CharacterDataWrapper.self, from: data)
        return charDataWrapper.data.results
    }
    
    func fetchComics(offset: Int, seriesID: Int, limit: Int = 1) async throws -> [Comic] {
        var comp = components
        comp.path = "/v1/public/series/\(seriesID)/comics"
        let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
        let offsetItem = URLQueryItem(name: "offset", value: "\(offset)")
        comp.queryItems?.append(contentsOf: [limitItem, offsetItem])
        let request = URLRequest(url: comp.url!)
        let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
        let decoder = JSONDecoder()
        let comicDataWrapper = try decoder.decode(ComicDataWrapper.self, from: data)
        return comicDataWrapper.data.results
    }
    
}
