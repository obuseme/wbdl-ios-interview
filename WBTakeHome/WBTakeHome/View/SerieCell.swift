//
//  SerieCell.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class SerieCell: UITableViewCell {
  
  static let cellIdentifer = "ComicCell"
  
  @IBOutlet weak var serieThumbnail: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var numberOfComicsLabel: UILabel!
  @IBOutlet weak var startDateLabel: UILabel!
  @IBOutlet weak var endDateLabel: UILabel!
  
  
  
}
