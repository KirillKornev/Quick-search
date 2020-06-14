//
//  UIViewController+extension.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showFailurInternetConnectionAlert(completionHandler: @escaping ()->()) {
    let alert = UIAlertController(title: "No internet", message: "Try later", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
  }
  
}
