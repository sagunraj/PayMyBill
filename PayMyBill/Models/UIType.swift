//
//  UIType.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct UIType: Codable {

  let type: String
  let values: [FieldValue]

  public enum CodingKeys: String, CodingKey {
    case type, values
  }
  
}
