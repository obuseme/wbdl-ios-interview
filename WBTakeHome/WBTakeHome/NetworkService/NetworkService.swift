//
//  NetworkService.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

struct Constant {
  static let apiKey = "85c7b54adcaa0855e0bbb38f79cbc5d9"
  static let hash = "4d7b828f0b543b65701704922cb63f2c"
}

class NetworkService {
  
  static let shared = NetworkService()
 
  
  let endpoint = "https://gateway.marvel.com:443/v1/public/series?ts=1&orderBy=startYear&apikey=\(Constant.apiKey)&hash=\(Constant.hash)"
  
  func fetchComicSeries(completion: @escaping ((Result<JSONPayload, NetworkError>) -> Void)) {
    let url = URL(string: endpoint)!
    
    let urlRequest = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if error != nil {
        completion(.failure(.badNetwork))
        return
      }
    
      if let response = response as? HTTPURLResponse,
         response.statusCode != 200 {
        completion(.failure(.badResponse))
        return
      }
      guard let data = data else {
        completion(.failure(.noData))
        return
      }

      do {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let jsonData = try jsonDecoder.decode(JSONPayload.self, from: data)
        DispatchQueue.main.async {
          completion(.success(jsonData))
        }
      } catch {
        NSLog("Error decoding bearer object: \(error)")
        completion(.failure(.badDecode))
        return
      }
    }.resume()
  }
  
  func fetchListsOfCharacters(seriesID: Int, completion: @escaping ((Result<ComicCharacterJSONPayload, NetworkError>) -> Void)) {
    let urlString = "https://gateway.marvel.com:443/v1/public/series/\(seriesID)/characters?ts=1&apikey=\(Constant.apiKey)&hash=\(Constant.hash)"
    let url = URL(string: urlString)!
    
    let urlRequest = URLRequest(url: url)
    print(url)
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if error != nil {
        completion(.failure(.badNetwork))
        return
      }
    print(response)
      if let response = response as? HTTPURLResponse,
         response.statusCode != 200 {
        completion(.failure(.badResponse))
        return
      }
      guard let data = data else {
        completion(.failure(.noData))
        return
      }

      do {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let jsonData = try jsonDecoder.decode(ComicCharacterJSONPayload.self, from: data)
        DispatchQueue.main.async {
          completion(.success(jsonData))
        }
      } catch {
        NSLog("Error decoding bearer object: \(error)")
        completion(.failure(.badDecode))
        return
      }
    }.resume()
//  https://gateway.marvel.com:443/v1/public/series/3306/characters?apikey=85c7b54adcaa0855e0bbb38f79cbc5d9
  }
}
