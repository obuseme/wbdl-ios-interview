//
//  CharacterView.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

final class CharacterView: UIView {
    
    let imageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    let nameLbl = Label(font: .systemFont(ofSize: 15, weight: .medium))
    let descLbl = Label(font: .systemFont(ofSize: 12, weight: .medium))
    
    var character: ComicCharacter
    
    init(character: ComicCharacter) {
        self.character = character
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        clipsToBounds = true
        layer.cornerRadius = 8
        nameLbl.textAlignment = .center
        nameLbl.text = character.name
        descLbl.textAlignment = .center
        descLbl.text = character.description
        descLbl.numberOfLines = 5
        imageView.insertImageFromURL(character.thumbnail.url)
        
        addSubviews(imageView, nameLbl, descLbl)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            
            nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 4),
            descLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            descLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
            descLbl.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
        ])
    }
    
}
