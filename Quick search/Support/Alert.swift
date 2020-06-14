//
//  Alert.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

struct Alert {
  
  private static func showBasicAlert(on vc: UIViewController,
                                     with title: String,
                                     message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(action)
    vc.present(alert, animated: true, completion: nil)
  }
  
  static func showFailurInternetConnectionAlert(on vc: UIViewController, completion: @escaping () -> ()) {
    let alert = UIAlertController(title: "Sorry, no internet connection!", message: "Try later!", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    let tryAction = UIAlertAction(title: "try again", style: .default) { (_) in
      completion()
    }
    alert.addAction(tryAction)
    alert.addAction(action)
    vc.present(alert, animated: true, completion: nil)
  }
}
