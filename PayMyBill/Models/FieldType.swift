//
//  FieldType.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct FieldType: Codable {

  let dataType: String
  let isArray: String
  let arrayName: String

  public enum CodingKeys: String, CodingKey {
    case dataType = "data_type"
    case isArray = "is_array"
    case arrayName = "array_name"
  }
  
}
