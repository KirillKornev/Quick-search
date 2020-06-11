//
//  PictureViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .green
      self.title = "Picture"
    collectionView.dataSource = self
    collectionView.delegate = self
    setupCollectionView()
    }
  
  func setupCollectionView() {
    let nibCell = UINib(nibName: "PictureCell", bundle: nil)
    collectionView.register(nibCell, forCellWithReuseIdentifier: "PictureCell")
  }

}

extension PictureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? PictureCell else { return UICollectionViewCell()}
//    cell.contentView.backgroundColor = .yellow
    return cell
  }
  
  
}
