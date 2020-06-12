//
//  RequestFactory.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

struct RequestFactory {
  
  //MARK:- Videos
  struct VideoItem {
    
    static func videoItemConfig(numberOfItems: Int, theme: String) -> RequestConfig<VideoParser> {
      return RequestConfig<VideoParser>.init(request: VideoRequest(numberOfItems: numberOfItems, theme: theme).urlRequest, parser: VideoParser())
    }
    
    static func videoPictureConfig(url: URL) -> RequestConfig<PictureParser> {
      return RequestConfig<PictureParser>.init(request: PictureGeneralRequest(url: url).urlRequest, parser: PictureParser())
    }

  }
  
  //MARK:- Pictures
  struct PictureItem {
    
    static func pictureItemsUrls(numberOfItems: Int, theme: String) -> RequestConfig<PictureFetchParser> {
      return RequestConfig<PictureFetchParser>.init(request: PictureRequest(numberOfItems: numberOfItems, theme: theme).urlRequest, parser: PictureFetchParser())
    }
    
    static func pictureConfig(url: URL) -> RequestConfig<PictureParser> {
      return RequestConfig<PictureParser>.init(request: PictureGeneralRequest(url: url).urlRequest, parser: PictureParser())
    }    
  }
  
}
