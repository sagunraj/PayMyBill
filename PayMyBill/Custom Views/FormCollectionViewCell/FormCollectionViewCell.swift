//
//  FormCollectionViewCell.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

final class FormCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak private var formTextField: UITextField!
  @IBOutlet weak private var formLabel: UILabel!

  func setupCell(with field: Field) {
    formLabel.text = field.placeholder
    formTextField.placeholder = field.hintText
  }

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
  }

}
