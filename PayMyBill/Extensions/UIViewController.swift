//
//  UIViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

extension UIViewController {

  func showAlertWithOk(with title: String,
                       and message: String) {
    let alertController = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in }
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

}

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
