//
//  VideoCell.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

  @IBOutlet weak var videoImage: UIImageView!
  @IBOutlet weak var videoNameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    setDefaultImage()
    videoImage.contentMode = .scaleAspectFill
    videoImage.layer.cornerRadius = 0.02 * contentView.frame.width
    }
  
  private func setDefaultImage() {
    guard let image = UIImage(named: IconPath.placeholderPicture) else { return }
    videoImage.image = image
  }
  
  func deletePicture() {
    setDefaultImage()
  }

  func configureCell(text: String, image: UIImage) {
    videoImage.image = image
    videoNameLabel.text = text
  }
  
}
