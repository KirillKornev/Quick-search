//
//  RequestFactory.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

struct RequestFactory {
  
  struct VideoItem {
    static func videoItemConfig(numberOfItems: Int, theme: String) -> RequestConfig<VideoParser> {
      return RequestConfig<VideoParser>.init(request: VideoRequest(numberOfItems: numberOfItems, theme: theme).urlRequest, parser: VideoParser())
    }
  }
  
  //struct PictureItem {
}
