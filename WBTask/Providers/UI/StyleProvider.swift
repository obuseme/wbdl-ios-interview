//
//  StyleProvider.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit

struct StyleProvider {
  static let titleFont = UIFont.systemFont(ofSize: 22, weight: .bold)
  static let subtitleFont = UIFont.systemFont(ofSize: 16, weight: .regular)
  static let subtitleBoldFont = UIFont.systemFont(ofSize: 16, weight: .bold)
  static let cellFont = UIFont.systemFont(ofSize: 14, weight: .regular)

  static let backgroundColor = UIColor.black
  static let titleColor = UIColor.white
  static let lightBackgroundColor = UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1.00)
  static let red = UIColor(red: 0.93, green: 0.11, blue: 0.14, alpha: 1.00)

  enum Paddings {
    static let xLarge: CGFloat = 48
    static let large: CGFloat = 32
    static let medium: CGFloat = 16
    static let small: CGFloat = 8
  }
}
