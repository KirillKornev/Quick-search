//
//  FlowLayout.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

  class FlowLayout: UICollectionViewFlowLayout {
  
  override func prepare() {
    super.prepare()
    guard let collectionView = collectionView else { return }
    
    let numOfColumns: CGFloat = 3
    let sectionInset: CGFloat = 5
    guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
    layout.sectionInset = UIEdgeInsets(top: sectionInset,
                                       left: sectionInset,
                                       bottom: sectionInset,
                                       right: sectionInset)
    let cellDimention = ((collectionView.bounds.width) - (sectionInset * 2) - (numOfColumns - 1) * sectionInset) / numOfColumns
    layout.itemSize = CGSize(width: cellDimention, height: cellDimention)
    layout.minimumLineSpacing = sectionInset
    layout.minimumInteritemSpacing = sectionInset
  }
}
