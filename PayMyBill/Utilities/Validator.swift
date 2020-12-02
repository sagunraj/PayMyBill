//
//  Validator.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

class Validator {

  func validateTextField(with regex: String,
                         and text: String,
                         completion: (Bool) -> Void) {
    let cleanString = text.trimmingCharacters(in: .whitespaces)
    let validationPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
    completion(validationPredicate.evaluate(with: cleanString))
  }

}
