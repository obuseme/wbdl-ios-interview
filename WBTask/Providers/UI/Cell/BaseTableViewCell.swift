//
//  BaseTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

  // MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

      contentView.backgroundColor = StyleProvider.backgroundColor
      selectionStyle = .none
      backgroundColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
