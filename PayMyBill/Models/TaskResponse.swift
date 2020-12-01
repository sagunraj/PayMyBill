//
//  TaskResponse.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

struct TaskResponse: Codable {

  let status: String
  let message: String
  let result: ResultField

  public enum CodingKeys: String, CodingKey {
    case status, message, result
  }
  
}
