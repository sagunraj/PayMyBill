//
//  Error.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

extension Optional where Wrapped == Error {

  var hasValue: Bool {
    return self != nil
  }

}
