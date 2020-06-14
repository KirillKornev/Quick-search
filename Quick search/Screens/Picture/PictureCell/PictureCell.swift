//
//  PictureCell.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
  
  @IBOutlet weak var pictureImage: UIImageView!
  override func awakeFromNib() {
    
    super.awakeFromNib()
    setDefaultImage()
    pictureImage.contentMode = .scaleToFill
  }
  
  func setDefaultImage() {
    guard let image = UIImage(named: IconPath.placeholderPicture) else { return }
    pictureImage.image = image
  }
  
  func configureCell(image: UIImage) {
    print("configure cell")
    pictureImage.image = image
    
  }

}
