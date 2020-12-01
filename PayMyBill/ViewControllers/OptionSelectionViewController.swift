//
//  ViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 11/30/20.
//

import UIKit

final class OptionSelectionViewController: BaseViewController {

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
    showActivityIndicator()
    NetworkManager.shared.getTaskForm(with: selectedIndex) { [weak self] (taskResponse, responseErrorMessage, error) in
      guard let self = self else { return }
      self.hideActivityIndicator()
      if responseErrorMessage.hasValue {
        self.showAlertWithOk(with: "Oopsies!", and: responseErrorMessage!)
      }

      if error.hasValue {
        self.showAlertWithOk(with: "Oopsies!", and: error!.localizedDescription)
      }

      DispatchQueue.main.async {
        guard let destinationVC = UIStoryboard(name: "Main",
                                               bundle: nil).instantiateViewController(withIdentifier: "FormViewController") as? FormViewController else { return }
        destinationVC.taskResponse = taskResponse
        self.navigationController?.pushViewController(destinationVC, animated: true)
      }
    }
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
    selectedIndex = row + 1
    goButton.isEnabled = true
  }

}
