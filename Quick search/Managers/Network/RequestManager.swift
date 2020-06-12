//
//  RequestManager.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

enum Result<T> {
  case success(T)
  case failure(Error)
}

protocol RequstManagerProtocol {
  func loadVideoList(completionHandler: @escaping ([VideoModel]?, Error?) -> ())
  func loadPicture(url: URL, completionHandler: @escaping (UIImage?, Error?) -> ())
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
  
  
  
  let link = "https://api.tenor.com/v1/search?q=car&key=3GUTCBEYYFEY&limit=2"
  
  func loadVideoList(completionHandler: @escaping ([VideoModel]?, Error?) -> ()) {
    var array = [VideoModel]()
    
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completionHandler(nil, error)
      }
      guard let data = data else { return }
      do {
        let items = try JSONDecoder().decode(VideoParseModel.self, from: data)
        let result = items.results
        for item in result {
          guard let path = item.media.first?.mp4.url else { return }
          guard let preview = item.media.first?.mp4.preview else { return }
          let title = item.title
          let model = VideoModel(pathURL: path, previewURL: preview, decription: title)
          array.append(model)
        }
        completionHandler(array, nil)
      } catch let  error {
        completionHandler(nil, error)
      }
    }.resume()
  }
  
  func loadPicture(url: URL, completionHandler: @escaping (UIImage?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completionHandler(nil, error)
      }
      guard let data = data else { return }
      let image = UIImage(data: data)
      completionHandler(image, nil)
    }.resume()
  }
  
}

