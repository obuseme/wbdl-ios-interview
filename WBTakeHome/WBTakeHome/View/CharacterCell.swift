//
//  CharacterCell.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
