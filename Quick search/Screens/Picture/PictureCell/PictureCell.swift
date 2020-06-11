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
    guard let image = UIImage(named: "placeholder") else { return }
    pictureImage.image = image
    }

}
