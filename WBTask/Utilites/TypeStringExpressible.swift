//
//  TypeStringExpressible.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import Foundation

protocol TypeStringExpressible: AnyObject {
  static var typeString: String { get }
}

extension TypeStringExpressible {

  var typeString: String {
    return String(describing: type(of: self))
  }

  static var typeString: String {
    return String(describing: self)
  }
}

extension NSObject: TypeStringExpressible { }
