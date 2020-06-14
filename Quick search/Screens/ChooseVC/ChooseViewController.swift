//
//  ChooseViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/14/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
  
  let assembly: ControllerBuilderProtocol = ControllerBuilder()
  
  @IBOutlet weak var goToPictureButton: UIButton!
  @IBOutlet weak var goToVideoButton: UIButton!
  
  @IBAction func goToPicture(_ sender: UIButton) {
    let vc = assembly.getPictureController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func goToVideo(_ sender: UIButton) {
    let vc = assembly.getVideoController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let videoImage = UIImage(named: IconPath.videoBarIcon) else { return }
    guard let pictureImage = UIImage(named: IconPath.pictureBarIcon) else { return }
    goToPictureButton.setImage(pictureImage, for: .normal)
    goToVideoButton.setImage(videoImage, for: .normal)
    }


}
