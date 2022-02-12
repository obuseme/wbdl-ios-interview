//
//  CollectionLoadingView.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

final class CollectionLoadingView: UIView {
    
    let indicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        indicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
