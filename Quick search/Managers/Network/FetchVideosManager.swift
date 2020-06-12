//
//  FetchVideosManager.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

class FetchVideosManager {
  
  let generalRequest = RequstManager()
  
  func fetchVideosUrls(number: Int, theme: String, complitionHandler: (@escaping ([VideoModel]) -> Void)) {
    let configuration = RequestFactory.VideoItem.videoItemConfig(numberOfItems: number, theme: theme)
    generalRequest.sendRequest(config: configuration) { (result) in
      switch result {
      case .failure(let error):
        print(error)
//        complitionHandler(.failure(error))
      case .success(let model):
        complitionHandler(model)
      }
    }
  }
  
}


