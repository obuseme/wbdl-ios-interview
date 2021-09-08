//
//  PosterTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit
import Kingfisher

class PosterTableViewCell: BaseTableViewCell {

  // MARK: - UI

  private lazy var posterImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
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
    posterImage.backgroundColor = StyleProvider.backgroundColor
    clipsToBounds = true

    contentView.addSubview(posterImage)

    posterImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.height.equalTo(200)
    }
  }

  func setPosterCell(_ thumbnail: Thumbnail) {
    posterImage.kf.setImage(with: thumbnail.getURL(with: .landscape))
  }
}
