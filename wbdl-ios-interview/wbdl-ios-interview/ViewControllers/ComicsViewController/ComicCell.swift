//
//  ComicCell.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit

/// This CollectionView cell is used on the ComicsViewController's collectionView.
final class ComicCell: UICollectionViewCell {
    
    let thumbImageView: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        return v
    }()
    
    let titleLbl = Label(font: .systemFont(ofSize: 16, weight: .medium))
    
    let issueLbl = Label(font: .systemFont(ofSize: 14))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        // The previous cells' image will be used if we don't reset it
        thumbImageView.image = nil
    }
    
    private func setupConstraints() {
        clipsToBounds = true
        layer.cornerRadius = 10
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(thumbImageView, titleLbl, issueLbl)
        
        NSLayoutConstraint.activate([
            thumbImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLbl.topAnchor.constraint(equalTo: thumbImageView.bottomAnchor, constant: 8),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            issueLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 6),
            issueLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            issueLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            issueLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
