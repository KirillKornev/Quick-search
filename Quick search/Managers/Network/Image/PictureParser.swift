//
//  PictureParser.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class PictureParser: IParser {
  typealias Model = UIImage
  
  func parse(data: Data) -> UIImage? {
    return UIImage(data: data)
  }
}

class PictureFetchParser: IParser {
  typealias Model = [ImageModel]
  
  func parse(data: Data) -> [ImageModel]? {
    var parseResult = [ImageModel]()
    do {
      let json = try JSONDecoder().decode(ImageDescriptionModel.self, from: data)
      let items = json.hits
      let urls = items.map({$0.webformatURL})
      for url in urls {
        parseResult.append(ImageModel(pathURL: url))
      }
    } catch {
      print("error")
    }
    return parseResult
  }
  
}
