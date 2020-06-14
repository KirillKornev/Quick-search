//
//  FetchPicturesManager.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

protocol FetchPicturesManagerProtocol {
  func fetchPicturesUrls(number: Int, theme: String, complitionHandler: (@escaping ([ImageModel]) -> Void))
}

class FetchPicturesManager: FetchPicturesManagerProtocol {
  
  let generalRequest = RequstManager()
  
  func fetchPicturesUrls(number: Int, theme: String, complitionHandler: (@escaping ([ImageModel]) -> Void)) {
    let configuration = RequestFactory.PictureItem.pictureItemsUrls(numberOfItems: number, theme: theme)
    generalRequest.sendRequest(config: configuration) { (result) in
      switch result {
      case .success(let model):
        complitionHandler(model)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func loadPicture(url: URL, completionHandler: @escaping (UIImage?) -> ()) {
    let configuration = RequestFactory.PictureItem.pictureConfig(url: url)
    generalRequest.sendRequest(config: configuration) { (result) in
      switch result {
      case .success(let model):
        completionHandler(model)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
}
