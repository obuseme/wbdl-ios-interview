//
//  ComicBookCell.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class ComicBookCell: UITableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
