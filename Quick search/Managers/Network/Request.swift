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

struct RequestConfig<Parser> where Parser: IParser {
  let request: URLRequest?
  let parser: Parser
}

protocol IParser {
  associatedtype Model
  func parse(data: Data) -> Model?
}

//MARK: Farctory

struct RequestFactory {
  
  struct VideoItem {
    static func videoItemConfig(numberOfItems: Int, theme: String) -> RequestConfig<VideoParser> {
      return RequestConfig<VideoParser>.init(request: VideoRequest(numberOfItems: numberOfItems, theme: theme).urlRequest, parser: VideoParser())
    }
  }
}

//MARK:- Parsing

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
