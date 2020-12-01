//
//  FormViewController.swift
//  PayMyBill
//
//  Created by Sagun Raj Lage on 12/1/20.
//

import UIKit

final class FormViewController: UIViewController {

  var taskResponse: TaskResponse!

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
    cell.setupCell(with: taskResponse.result.fields[indexPath.row])
    return cell
  }

}
