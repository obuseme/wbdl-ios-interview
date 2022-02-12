//
//  Label.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

final class Label: UILabel {
    
    init(font: UIFont = UIFont.systemFont(ofSize: 16)) {
        super.init(frame: .zero)
        self.font = font
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
