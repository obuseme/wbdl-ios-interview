//
//  TitleTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit

class TitleTableViewCell: BaseTableViewCell {

  // MARK: - UI

  private lazy var nameLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.subtitleBoldFont
    label.textColor = StyleProvider.red
    return label
  }()

  private lazy var titleLabel: UILabel = {
    let label  = UILabel()
    label.font = StyleProvider.subtitleBoldFont
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
    contentView.backgroundColor = StyleProvider.lightBackgroundColor

    contentView.addSubview(nameLabel)
    contentView.addSubview(titleLabel)

    nameLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(StyleProvider.Paddings.medium)
      make.bottom.equalToSuperview().offset(-StyleProvider.Paddings.medium).priority(.low)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(StyleProvider.Paddings.small)
      make.leading.equalTo(nameLabel)
      make.trailing.bottom.equalToSuperview().offset(-StyleProvider.Paddings.medium)
    }
  }

  func setTitleCell(_ label: String, title: String?) {
    nameLabel.text = label
    guard let title = title else {
      titleLabel.removeFromSuperview()
      return
    }
    titleLabel.text = title
  }
}
