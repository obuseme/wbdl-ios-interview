//
//  ImageFetcher.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

struct ImageFetcher {
    static let shared = ImageFetcher()
    
    private init() {}
    
    func downloadImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            return UIImage(systemName: "photo")!
        }
        let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
        if let imageFromData = UIImage(data: data) {
            return imageFromData
        } else {
            return UIImage(systemName: "photo")!
        }
    }
}
