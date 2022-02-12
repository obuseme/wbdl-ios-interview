//
//  UIKitExtensions.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIImageView {
    /// Use this method to set the image of a UIImageView from a url
    /// - Parameter url: the the url (as a string) of the image
    func insertImageFromURL(_ url: String) {
        Task {
            do {
                let downloadedImg = try await ImageFetcher.shared.downloadImage(urlString: url)
                await MainActor.run {
                    image = downloadedImg
                }
            } catch {
                showPlaceholder()
            }
        }
    }
    
    func showPlaceholder() {
        image = UIImage(systemName: "photo")
    }
}
