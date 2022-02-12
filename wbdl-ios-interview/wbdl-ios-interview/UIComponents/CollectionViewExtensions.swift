//
//  CollectionViewExtensions.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

extension UICollectionView {
    func showEmptyView(text: String) {
        let v = CollectionEmptyView()
        v.label.text = text
        backgroundView = v
    }
    
    func showLoadingView() {
        backgroundView = CollectionLoadingView()
    }
}
