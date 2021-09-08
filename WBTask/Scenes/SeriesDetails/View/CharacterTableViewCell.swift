//
//  CharacterTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit

class CharacterTableViewCell: BaseTableViewCell {

  // MARK: - UI

  private lazy var thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 4
    imageView.clipsToBounds = true
    return imageView
  }()

  private lazy var nameLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.subtitleBoldFont
    label.textColor = StyleProvider.red
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.cellFont
    label.textColor = StyleProvider.titleColor
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  // MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

      setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Layout

  private func setupUI() {
    contentView.addSubview(thumbnailImage)
    contentView.addSubview(nameLabel)
    contentView.addSubview(descriptionLabel)

    thumbnailImage.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview().offset(StyleProvider.Paddings.medium)
      make.height.equalTo(150)
      make.width.equalTo(100)
      make.bottom.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
    nameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(StyleProvider.Paddings.small).priority(.high)
      make.leading.equalTo(thumbnailImage.snp.trailing).offset(StyleProvider.Paddings.small)
      make.trailing.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.trailing.equalTo(nameLabel)
      make.bottom.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
  }

  func setCharacterCell(_ character: SeriesCharacter) {
    thumbnailImage.kf.setImage(with: character.thumbnail.getURL(with: .portrait))
    nameLabel.text = character.name
    descriptionLabel.text = character.description
  }
}
