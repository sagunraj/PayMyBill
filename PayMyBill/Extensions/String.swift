//
//  Optional.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

extension String {

  var boolValue: Bool {
    return (self as NSString).boolValue
  }

}

extension Optional where Wrapped == String {

  var hasValue: Bool {
    return self != nil
  }

}
