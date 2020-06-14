//
//  PictureViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
  
  let check = CheckInternetConnection()
  
  let fetchImageManager = FetchPicturesManager()
  
  var pictures = [ImageModel]()
  
  let assembly: ControllerBuilderProtocol = ControllerBuilder()

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .green
      self.title = "Picture"
    collectionView.dataSource = self
    collectionView.delegate = self
    setupCollectionView()
    createBarItems()
    check.checkConnection { (result) in
      if result == false {
        DispatchQueue.main.async {
          Alert.showFailurInternetConnectionAlert(on: self) {
            print("try later")
          }
        }
      }
    }
    getPictureList(number: 5, theme: "Nature")
    }
  
  func getPictureList(number: Int, theme: String) {
    fetchImageManager.fetchPicturesUrls(number: number, theme: theme) { (pictures) in
      self.pictures = pictures
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  private func setupCollectionView() {
    let nibCell = UINib(nibName: String(describing: PictureCell.self), bundle: nil)
    collectionView.register(nibCell, forCellWithReuseIdentifier: String(describing: PictureCell.self))
  }
  
  private func createBarItems() {
    let rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(goToSettings))
    self.navigationItem.rightBarButtonItem  = rightBarButtonItem
  }
  
  @objc
   func goToSettings() {
    let controller = assembly.getSettingController()
    controller.delegate = self
    present(controller, animated: true, completion: nil)
  }

}

extension PictureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pictures.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PictureCell.self), for: indexPath) as? PictureCell else { return UICollectionViewCell()}
    let url = pictures[indexPath.row].pathURL
    cell.setDefaultImage()

    fetchImageManager.loadPicture(url: url) { (image) in
      guard let image = image else { return }
      DispatchQueue.main.sync {
        cell.configureCell(image: image)
      }
    }
    return cell
  }
}

extension PictureViewController: SettingsViewDelegate {
  func sendInfo(number: Int, theme: String) {
    getPictureList(number: number, theme: theme)
  }
  
}
