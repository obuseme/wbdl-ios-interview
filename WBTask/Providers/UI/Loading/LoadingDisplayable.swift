//
//  LoadingDisplayable.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation
import ProgressHUD

protocol LoadingDisplayable: UIViewController {
  func displayLoading()
  func dismissLoading()
}

extension LoadingDisplayable {
  func displayLoading() {
    ProgressHUD.show()
  }

  func dismissLoading() {
    ProgressHUD.dismiss()
  }
}
