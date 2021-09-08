//
//  ComicsCollectionViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit

class ComicsCollectionViewCell: UICollectionViewCell {

  // MARK: - UI

  private lazy var thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()

  private lazy var nameLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.cellFont
    label.textColor = StyleProvider.titleColor
    label.numberOfLines = 2
    label.lineBreakMode = .byTruncatingTail
    return label
  }()

  private lazy var numberImage: UIImageView = {
    let image = UIImage(systemName: "number.square.fill")
    let imageView = UIImageView(image: image)
    imageView.tintColor = StyleProvider.red
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var numberLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.cellFont
    label.textColor = StyleProvider.titleColor
    return label
  }()

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    contentView.layer.cornerRadius = 8.0
    contentView.clipsToBounds = true
    contentView.backgroundColor = StyleProvider.lightBackgroundColor

    setupLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Layout

  private func setupLayout() {
    contentView.addSubview(thumbnailImage)
    contentView.addSubview(nameLabel)
    contentView.addSubview(numberImage)
    contentView.addSubview(numberLabel)

    thumbnailImage.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.height.equalTo(120)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(thumbnailImage.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.equalToSuperview().offset(StyleProvider.Paddings.small)
      make.trailing.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
    numberImage.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.equalToSuperview().offset(StyleProvider.Paddings.small)
      make.height.width.equalTo(numberLabel.snp.height)
      make.bottom.equalToSuperview().offset(-StyleProvider.Paddings.medium)
    }
    numberLabel.snp.makeConstraints { make in
      make.top.equalTo(numberImage)
      make.leading.equalTo(numberImage.snp.trailing).offset(StyleProvider.Paddings.small)
    }
  }

  func setComicsCell(_ comics: Comics) {
    thumbnailImage.kf.setImage(with: comics.thumbnail.getURL(with: .portrait))
    nameLabel.text = comics.title
    numberLabel.text = "\(comics.issueNumber)"
  }
}
