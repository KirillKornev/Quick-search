//
//  VideoParser.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

class VideoParser: IParser {
  typealias Model = [VideoModel]
  
  func parse(data: Data) -> [VideoModel]? {
    var parseResult = [VideoModel]()
    do {
      let json = try JSONDecoder().decode(VideoParseModel.self, from: data)
      let result = json.results
      for item in result {
        if let path = item.media.first?.mp4.url,
          let preview = item.media.first?.mp4.preview {
          let title = item.title
          let model = VideoModel(pathURL: path, previewURL: preview, decription: title)
          parseResult.append(model)
        }
      }
    } catch {
      print("error")
    }
    return parseResult
  }
}
