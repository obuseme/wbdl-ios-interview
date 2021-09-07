//
//  Date+Extension.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//

import Foundation

extension Date {

  static func isoDateToNumberedDateString(isoDate: String?) -> String {
    guard let date = isoDate else {
      return ""
    }
    let isoDateFormatter = Date.isoDateFormatter
    if let date = isoDateFormatter.date(from: date) {
      return Date.numberedDateFormatter.string(from: date)
    }

    return ""
  }

  private static let isoDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter
  }()

  private static let numberedDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter
  }()
}
