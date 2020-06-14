//
//  TabBarController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  let assembly: ControllerBuilderProtocol = ControllerBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
      tabBar.barTintColor = .black
      tabBar.tintColor = .red
      setupBar()
    }
    
  private func setupBar() {
    guard let image1 = UIImage(named: IconPath.pictureBarIcon) else { return }
    guard let image2 = UIImage(named: IconPath.videoBarIcon) else { return }
    let mediaController = createNavController(vc: assembly.getChooseController(), icon: image1)
    let searchController = createNavController(vc: assembly.getInternetSearchingController(), icon: image2)
    viewControllers = [mediaController, searchController]
    
    guard let items = tabBar.items else { return }
    for item in items {
      item.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
  }

}

extension TabBarController {
  func createNavController(vc: UIViewController, icon: UIImage) -> UINavigationController {
    let navController = UINavigationController(rootViewController: vc)
    navController.tabBarItem.image = icon
    return navController
  }
}
