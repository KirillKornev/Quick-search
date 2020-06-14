//
//  RequestManager.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

protocol RequstManagerProtocol {
  func sendRequest<Parser>(config: RequestConfig<Parser>, completionHandler: @escaping (Result<Parser.Model>) -> Void)
}

class RequstManager: RequstManagerProtocol {
  
  let sessionConfiguration = URLSessionConfiguration.ephemeral
  lazy var session = URLSession.init(configuration: sessionConfiguration)
  
   func sendRequest<Parser>(config: RequestConfig<Parser>, completionHandler: @escaping (Result<Parser.Model>) -> Void)  {
    guard let urlRequest = config.request else { return }
    session.dataTask(with: urlRequest) { (data, response, error) in
      if let error = error {
        completionHandler(.failure(error))
      }
      guard let data = data, let model: Parser.Model = config.parser.parse(data: data) else { return }
      completionHandler(.success(model))
    }.resume()
  }
  
}

