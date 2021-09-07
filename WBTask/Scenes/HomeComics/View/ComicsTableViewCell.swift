//
//  ComicsTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit
import Kingfisher

class ComicsTableViewCell: UITableViewCell {

  // MARK: - UI

  private lazy var thumbnailImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 4
    imageView.clipsToBounds = true
    return imageView
  }()

  private lazy var titleLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.subtitleFont
    label.textColor = StyleProvider.titleColor
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  private lazy var countImage: UIImageView = {
    let image = UIImage(systemName: "number.square.fill")
    let imageView = UIImageView(image: image)
    imageView.tintColor = StyleProvider.red
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var countLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.cellFont
    label.textColor = StyleProvider.titleColor
    return label
  }()

  private lazy var calendarImage: UIImageView = {
    let image = UIImage(systemName: "calendar")
    let imageView = UIImageView(image: image)
    imageView.tintColor = StyleProvider.red
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var datesLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.cellFont
    label.textColor = StyleProvider.titleColor
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
    contentView.backgroundColor = StyleProvider.backgroundColor
    selectionStyle = .none
    backgroundColor = .white

    contentView.addSubview(thumbnailImage)
    contentView.addSubview(titleLabel)
    contentView.addSubview(countImage)
    contentView.addSubview(countLabel)
    contentView.addSubview(calendarImage)
    contentView.addSubview(datesLabel)

    thumbnailImage.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview().offset(StyleProvider.Paddings.medium)
      make.height.equalTo(150)
      make.width.equalTo(100)
      make.bottom.equalToSuperview()
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(thumbnailImage).offset(StyleProvider.Paddings.small)
      make.leading.equalTo(thumbnailImage.snp.trailing).offset(StyleProvider.Paddings.small)
      make.trailing.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
    countImage.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.equalTo(thumbnailImage.snp.trailing).offset(StyleProvider.Paddings.small)
      make.height.width.equalTo(24)
    }
    countLabel.snp.makeConstraints { make in
      make.centerY.equalTo(countImage)
      make.leading.equalTo(countImage.snp.trailing).offset(StyleProvider.Paddings.small)
    }
    calendarImage.snp.makeConstraints { make in
      make.top.equalTo(countImage.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.equalTo(thumbnailImage.snp.trailing).offset(StyleProvider.Paddings.small)
      make.height.width.equalTo(24)
    }
    datesLabel.snp.makeConstraints { make in
      make.centerY.equalTo(calendarImage)
      make.leading.equalTo(countImage.snp.trailing).offset(StyleProvider.Paddings.small)
    }
  }

  func setComicsCell(_ comics: HomeComicsViewModel) {
    thumbnailImage.kf.setImage(with: comics.thumbnailURL)
    titleLabel.text = comics.title
    countLabel.text = comics.issueNumber
    datesLabel.text = comics.dates
  }
}
