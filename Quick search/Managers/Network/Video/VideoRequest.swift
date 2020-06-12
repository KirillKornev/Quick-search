//
//  Request.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

//MARK:- URLRequest
class VideoRequest {
  
  var urlRequest: URLRequest?
  init(numberOfItems: Int, theme: String) {
    urlRequest = URLRequest(url: createURL(item: numberOfItems, theme: theme))
  }
  
  func createURL(item: Int, theme: String) -> URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.tenor.com"
    components.path = "/v1/search"
    let queryItems = [
                      URLQueryItem(name: "q", value: "\(theme)"),
                      URLQueryItem(name: "key", value: "3GUTCBEYYFEY"),
                      URLQueryItem(name: "limit", value: "\(item)")]
    components.queryItems = queryItems
    guard let url = components.url else {
      preconditionFailure( "Invalid URL components \(components)" ) }
    return url
  }
}

class PictureGeneralRequest {
  var urlRequest: URLRequest?
  init(url: URL) {
    urlRequest = URLRequest(url: url)
  }
}



