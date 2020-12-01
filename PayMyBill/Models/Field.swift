//
//  Field.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct Field: Codable {

  let name: String
  let placeholder: String
  let regex: String
  let type: FieldType
  let isMandatory: String
  let hintText: String
  let uiType: UIType

  public enum CodingKeys: String, CodingKey {
    case name, placeholder, regex, type
    case isMandatory = "is_mandatory"
    case hintText = "hint_text"
    case uiType = "ui_type"
  }
  
}
