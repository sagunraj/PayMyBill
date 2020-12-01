//
//  NetworkManager.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import Foundation

class NetworkManager {

  static let shared = NetworkManager()

  private init() {}

  func getTaskForm(with taskId: Int, and completionHandler: @escaping (String?, Error?) -> Void) {
    guard let url = URL(string: "https://api-staging.bankaks.com/task/\(taskId)") else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completionHandler(nil, error)
        return
      }
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        completionHandler("An unexpected error caused with error code \(String(describing: response))", nil)
        return
      }

    }
    task.resume()
  }
}
