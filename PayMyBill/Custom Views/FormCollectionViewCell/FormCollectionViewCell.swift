//
//  FormCollectionViewCell.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

enum TextFieldType: String {
  case dropdown = "dropdown"
  case textField = "textfield"
}

protocol FormCVCellDelegate: class {
  func didUpdateTextFieldCharacters(with textString: String, and field: Field)
}

final class FormCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak private var formTextField: UITextField!
  @IBOutlet weak private var formLabel: UILabel!

  weak var delegate: FormCVCellDelegate?

  private var field: Field!
  private var pickerView: UIPickerView!

  func setupCell(with field: Field, and delegate: FormCVCellDelegate) {
    self.field = field
    self.delegate = delegate
    formLabel.text = "\(field.placeholder) \(field.isMandatory.boolValue ? "*" : "")"
    formTextField.placeholder = field.hintText
    if field.uiType.type == TextFieldType.dropdown.rawValue {
      pickerView = UIPickerView()
      pickerView.dataSource = self
      pickerView.delegate = self
      formTextField.inputView = pickerView
    }
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

extension FormCollectionViewCell: UIPickerViewDelegate, UIPickerViewDataSource {

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return field.uiType.values.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return field.uiType.values[row].name
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    formTextField.text = field.uiType.values[row].name
    delegate?.didUpdateTextFieldCharacters(with: field.uiType.values[row].id,
                                           and: field)
  }

}
