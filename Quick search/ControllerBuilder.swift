//
//  ControllerBuilder.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

protocol ControllerBuilderProtocol {
  func getVideoController() -> VideoViewController
  func getPictureController() -> PictureViewController
}

class ControllerBuilder: ControllerBuilderProtocol {
  
    func getVideoController() -> VideoViewController {
      let videoViewController = VideoViewController(nibName: String(describing: VideoViewController.self), bundle: nil)
    return videoViewController 
  }
  
  func getPictureController() -> PictureViewController {
    let pictureViewController = PictureViewController(nibName: String(describing: PictureViewController.self), bundle: nil)
    return pictureViewController
  }
}
