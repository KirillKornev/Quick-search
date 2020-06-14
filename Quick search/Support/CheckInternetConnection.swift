//
//  CheckInternetConnection.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation
import  Network

class CheckInternetConnection {
  
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: "Monitor")
  
  func checkConnection(completionHandler: @escaping (Bool) -> Void)  {
    monitor.pathUpdateHandler = { path in
      if path.status == .satisfied {
        completionHandler(true)
      } else {
        print("no connection")
        completionHandler(false)
      }
    }
    monitor.start(queue: queue)
  }
  
}
