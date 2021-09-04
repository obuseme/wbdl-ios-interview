//
//  NetworkProvider.swift
//  WBTask
//
//  Created by Ugur on 04/09/2021.
//

import Foundation

protocol NetworkProviderProtocol {
  func performRequest<T: Decodable>(_ request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class NetworkProvider: NSObject, NetworkProviderProtocol {

  // MARK: Properties

  private let successfulHttpCodes = 200..<300

  // MARK: NetworkProviderProtocol

  func performRequest<T: Decodable>(_ request: NetworkRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
    guard ConnectionCheck.isConnectedToNetwork() else {
      completion(.failure(.noConnection))
      return
    }

    let urlRequest = prepareRequest(for: request)

    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if let error = error {
        completion(.failure(.external(error)))
        return
      }

      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(.invalidResponse))
        return
      }

      guard self.successfulHttpCodes.contains(httpResponse.statusCode) else {
      let responseString = data.flatMap { String(data: $0, encoding: .utf8) } ?? "No data received"
        print("Fetching failed; Server responded with status code \(httpResponse.statusCode), response data: \(responseString)")
      completion(.failure(.serverError))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let object = try decoder.decode(T.self, from: data)
        completion(.success(object))
        return
      } catch {
        completion(.failure(.invalidJSON(error)))
      }
    }
    task.resume()
  }

  private func prepareRequest(for request: NetworkRequest) -> URLRequest {
    let urlString = [Configuration.baseURL + "/" + request.path].joined()

    guard let url = URL(string: urlString) else {
      preconditionFailure("Requirements are not met for a valid URL")
    }
    var urlRequest = URLRequest(url: url)

    switch request.parameters {
    case .body(let parameters):
      if let parameters = parameters {
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
    case .url(let params):
      if let params = params {
        let queryParams = params.map({ element -> URLQueryItem in
          return URLQueryItem(name: element.key, value: element.value)
        })

        var components = URLComponents(string: urlString)
        components?.queryItems = queryParams
        urlRequest.url = components?.url
      }
    }

    request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }

    urlRequest.httpMethod = request.method.rawValue

    return urlRequest
  }
}
