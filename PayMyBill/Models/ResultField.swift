//
//  ResultField.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct ResultField: Codable {

  let numberOfFields: Int
  let screenTitle: String
  let operatorName: String
  let serviceId: String
  let fields: [Field]

  public enum CodingKeys: String, CodingKey {
    case numberOfFields = "number_of_fields"
    case screenTitle = "screen_title"
    case operatorName = "operator_name"
    case serviceId = "service_id"
    case fields
  }
  
}
