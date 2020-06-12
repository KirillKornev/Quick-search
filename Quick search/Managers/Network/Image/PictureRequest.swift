//
//  PictureRequest.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

class PictureRequest {
  
  var urlRequest: URLRequest?
  
  init(numberOfItems: Int, theme: String) {
    urlRequest = URLRequest(url: createURL(item: numberOfItems, theme: theme))
  }
  
  func createURL(item: Int, theme: String) -> URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "pixabay.com"
      components.path = "/api/"
    
      let queryItems = [URLQueryItem(name: "key", value: "16076668-c55cfb876647e880222b84519"),
                        URLQueryItem(name: "q", value: "\(theme)"),
                        URLQueryItem(name: "image_type", value: "photo"),
                        URLQueryItem(name: "pretty", value: "true"),
                        URLQueryItem(name: "per_page", value: "\(item)")]
      components.queryItems = queryItems
    guard let url = components.url else {
      preconditionFailure( "Invalid URL components \(components)" ) }
    return url
  }
}

