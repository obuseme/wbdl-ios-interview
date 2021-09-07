//
//  AlertDisplayable.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import UIKit

protocol AlertDisplayable: UIViewController {
  func displayAlert(title: String, message: String)
}

extension AlertDisplayable {
  func displayAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
