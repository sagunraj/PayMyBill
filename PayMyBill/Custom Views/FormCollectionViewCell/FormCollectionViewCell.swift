//
//  FormCollectionViewCell.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

protocol FormCVCellDelegate: class {
  func didUpdateTextFieldCharacters(with textString: String, and field: Field)
}

final class FormCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak private var formTextField: UITextField!
  @IBOutlet weak private var formLabel: UILabel!

  weak var delegate: FormCVCellDelegate?

  private var field: Field!

  func setupCell(with field: Field, and delegate: FormCVCellDelegate) {
    self.field = field
    formLabel.text = field.placeholder
    formTextField.placeholder = field.hintText
    self.delegate = delegate
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    formTextField.delegate = self
  }

}

// MARK: - UITextFieldDelegate
extension FormCollectionViewCell: UITextFieldDelegate {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let textFieldText = textField.text else {
      delegate?.didUpdateTextFieldCharacters(with: "", and: field)
      return true
    }
    let text = textFieldText as NSString
    let fullText = text.replacingCharacters(in: range, with: string)
    delegate?.didUpdateTextFieldCharacters(with: fullText, and: field)
    return true
  }

}
