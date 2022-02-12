//
//  SeriesHeader.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

final class SeriesHeader: UICollectionReusableView {
    
    lazy var thumbImageView: UIImageView = {
        let v = UIImageView(frame: bounds)
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    let titleLbl = Label(font: .systemFont(ofSize: 22, weight: .bold))
    
    let charStackView: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.distribution = .fillEqually
        v.spacing = 10
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLbl.layer.shadowColor = UIColor.black.cgColor
        titleLbl.layer.shadowRadius = 2
        titleLbl.layer.shadowOpacity = 1
        titleLbl.layer.shadowOffset = CGSize(width: 1, height: 1)
        addSubviews(thumbImageView, titleLbl, charStackView)
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            charStackView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10),
            charStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            charStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            charStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
}

