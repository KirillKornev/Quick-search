//
//  DeleteViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit
//import  SystemConfiguration
import Network

class DeleteViewController: UIViewController {
  
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "Monitor")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    monitor.pathUpdateHandler = { path in
      if path.status == .satisfied {
        print("connection sucseed")
      } else {
        print("no connection")
      }
    }

    monitor.start(queue: queue)
  }
  
  
}
