//
//  SubmissionData.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/2/20.
//

import Foundation

class SubmissionData {

  var fieldData: Field
  var textValue: String

  init(fieldData: Field, value: String) {
    self.fieldData = fieldData
    self.textValue = value
  }
  
}
