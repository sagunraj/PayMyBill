//
//  UIViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

extension UIViewController {

  func showAlertWithOk(with title: String,
                       and message: String,
                       completion: @escaping (UIAlertAction) -> Void = { _ in }) {
    let alertController = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK",
                                 style: .cancel,
                                 handler: completion)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

}

// MARK: - For Recognizing Tap on The Main View
extension UIViewController {

    func hideKeyboardWhenTappedOnMainView() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}
