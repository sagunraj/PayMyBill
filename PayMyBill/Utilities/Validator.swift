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
                         fieldType: String,
                         completion: (Bool) -> Void) {
    let cleanString = text.trimmingCharacters(in: .whitespaces)
    var validationPredicate: NSPredicate!
    if fieldType.contains("email") {
      validationPredicate = NSPredicate(format: "SELF MATCHES %@", isValid(regex: regex, testString: "someone@google.com") ? regex : "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}")
    } else if fieldType.contains("phone") {
      validationPredicate = NSPredicate(format: "SELF MATCHES %@", isValid(regex: regex, testString: "9876543210") ? regex : "^(\\s|\\S)*(\\S)+(\\s|\\S)*$")
    }
    completion(validationPredicate.evaluate(with: cleanString))
  }

  private func isValid(regex: String, testString: String) -> Bool {
    do {
      let regex = try NSRegularExpression(pattern: regex)
      let nsString = testString as NSString
      let results = regex.matches(in: testString, range: NSRange(location: 0, length: nsString.length))
      if results.count == 0 {
        return false
      }
    } catch {
      return false
    }
    return true
  }

}
