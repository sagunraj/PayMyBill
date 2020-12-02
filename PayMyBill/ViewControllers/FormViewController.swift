//
//  FormViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

final class FormViewController: UIViewController {

  var taskResponse: TaskResponse!
  
  private var submissionData: [SubmissionData] = []

  @IBOutlet weak private var proceedButton: UIButton!
  @IBOutlet weak private var formCollectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupCollectionView()
  }

  private func setupCollectionView() {
    formCollectionView.delegate = self
    formCollectionView.dataSource = self
    formCollectionView.register(UINib(nibName: "FormCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "FormCollectionViewCell")
  }

  private func setupView() {
    title = taskResponse.result.screenTitle
    proceedButton.isEnabled = false
  }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FormViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return taskResponse.result.numberOfFields
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FormCollectionViewCell", for: indexPath) as? FormCollectionViewCell else { return UICollectionViewCell()
    }
    cell.setupCell(with: taskResponse.result.fields[indexPath.row],
                   and: self)
    return cell
  }

}

// MARK: - FormCVCellDelegate
extension FormViewController: FormCVCellDelegate {

  func didUpdateTextFieldCharacters(with textString: String, and field: Field) {
    if let existingSubmissionValue = submissionData.first(where: { $0.fieldData.name == field.name }) {
      existingSubmissionValue.textValue = textString
    }
    else {
      submissionData.append(SubmissionData(fieldData: field, value: textString))
    }
    proceedButton.isEnabled = areAllMandatoryFieldsFilled()
  }

  func areAllMandatoryFieldsFilled() -> Bool {
    let mandatoryFieldsCount = taskResponse.result.fields.filter { $0.isMandatory.boolValue }.count
    let filledFieldsCount = submissionData.filter { !$0.textValue.isEmpty }.count
    return mandatoryFieldsCount == filledFieldsCount
  }

}
