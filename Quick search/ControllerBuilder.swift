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
  func getSettingController() -> SettingsViewController
  func getChooseController() -> ChooseViewController
  func getInternetSearchingController() -> InternetSearchingViewController
}

class ControllerBuilder: ControllerBuilderProtocol {
  
  func getChooseController() -> ChooseViewController {
    let searchController = ChooseViewController(nibName: String(describing: ChooseViewController.self), bundle: nil)
    return searchController
  }
  
  func getVideoController() -> VideoViewController {
    let videoViewController = VideoViewController(nibName: String(describing: VideoViewController.self), bundle: nil)
    return videoViewController 
  }
  
  func getPictureController() -> PictureViewController {
    let pictureViewController = PictureViewController(nibName: String(describing: PictureViewController.self), bundle: nil)
    return pictureViewController
  }
  
  func getSettingController() -> SettingsViewController {
    let settingsViewController = SettingsViewController(nibName: String(describing: SettingsViewController.self), bundle: nil)
    return settingsViewController
  }
  
  func getInternetSearchingController() -> InternetSearchingViewController {
    let internetSearchingController = InternetSearchingViewController(nibName: String(describing: InternetSearchingViewController.self), bundle: nil)
    return internetSearchingController
    
  }
}
