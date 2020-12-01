//
//  BaseViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

class BaseViewController: UIViewController {

  var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

  var greyView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func showActivityIndicator() {
    view.isUserInteractionEnabled = false

    activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = .large
    view.addSubview(activityIndicator)
    activityIndicator.startAnimating()

    greyView = UIView()
    greyView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    greyView.center = activityIndicator.center
    greyView.layer.cornerRadius = 10.0
    greyView.backgroundColor = .lightGray
    greyView.alpha = 0.5
    view.addSubview(greyView)
  }

  func hideActivityIndicator() {
    DispatchQueue.main.async {
      self.view.isUserInteractionEnabled = true
      self.activityIndicator.stopAnimating()
      self.greyView.removeFromSuperview()
    }
  }

}
