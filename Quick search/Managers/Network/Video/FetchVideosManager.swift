//
//  FetchVideosManager.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

protocol FetchVideosManagerProtocol {
  func fetchVideosUrls(number: Int, theme: String, complitionHandler: (@escaping ([VideoModel]) -> Void))
  func loadPicture(url: URL, completionHandler: @escaping (UIImage?) -> ())
}

class FetchVideosManager: FetchVideosManagerProtocol {
  
  let generalRequest = RequstManager()
  
  func fetchVideosUrls(number: Int, theme: String, complitionHandler: (@escaping ([VideoModel]) -> Void)) {
    let configuration = RequestFactory.VideoItem.videoItemConfig(numberOfItems: number, theme: theme)
    generalRequest.sendRequest(config: configuration) { (result) in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let model):
        complitionHandler(model)
      }
    }
  }
  
  func loadPicture(url: URL, completionHandler: @escaping (UIImage?) -> ()) {
    let configuration = RequestFactory.VideoItem.videoPictureConfig(url: url)
    generalRequest.sendRequest(config: configuration) { (result) in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let model):
        completionHandler(model)
      }
    }
  }
  
}


