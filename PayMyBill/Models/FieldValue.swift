//
//  FieldValues.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct FieldValue: Codable {

  let name: String
  let id: String

  public enum CodingKeys: String, CodingKey {
    case name, id
  }
  
}
