//
//  ViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 11/30/20.
//

import UIKit

final class OptionSelectionViewController: UIViewController {

  @IBOutlet weak private var goButton: UIButton!
  @IBOutlet weak private var chooseOptionTextField: UITextField!

  private let pickerView = UIPickerView()

  private let optionsArray = ["Option 1", "Option 2", "Option 3"]
  private var selectedIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedOnMainView()
    setupPickerView()
    setupView()
  }

  private func setupPickerView() {
    pickerView.delegate = self
    pickerView.dataSource = self
  }

  private func setupView() {
    chooseOptionTextField.inputView = pickerView
    goButton.isEnabled = false
  }

}

// MARK: - Actions
extension OptionSelectionViewController {

  @IBAction func onGoButtonTap(_ sender: UIButton) {
    let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormViewController")
    navigationController?.pushViewController(destinationVC, animated: true)
  }

}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension OptionSelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return optionsArray.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return optionsArray[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    chooseOptionTextField.text = optionsArray[row]
    selectedIndex = row
    goButton.isEnabled = true
  }

}
