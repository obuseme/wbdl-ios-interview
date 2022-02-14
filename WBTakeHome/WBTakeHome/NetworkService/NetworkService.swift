//
//  NetworkService.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation

class NetworkService {
  
  static let shared = NetworkService()
  
  let endpoint = "https://gateway.marvel.com:443/v1/public/series?ts=1&orderBy=startYear&apikey=85c7b54adcaa0855e0bbb38f79cbc5d9&hash=4d7b828f0b543b65701704922cb63f2c"
  
  func fetchComicSeries(completion: @escaping ((Result<JSONPayload, NetworkError>) -> Void)) {
    let url = URL(string: endpoint)!
    
    let urlRequest = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if error != nil {
        completion(.failure(.badNetwork))
        return
      }
      // Handle client and server errors that generate non 200 status codes.
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
}
