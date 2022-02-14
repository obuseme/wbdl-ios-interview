//
//  DetailViewController.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class DetailViewController: UITableViewController {
  var comic: ComicSerie?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(comic?.id)
  }
}
