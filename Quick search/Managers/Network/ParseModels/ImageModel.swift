//
//  ImageModel.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

struct VideoParseModel: Decodable {
    
    struct MP4: Decodable {
        let url: URL
        let preview: URL
    }
    
    struct Media: Decodable {
        let mp4: MP4
    }
    
    struct Result: Decodable {
        let media: [Media]
        let title: String
    }
    
    let results: [Result]
}

struct VideoModel {
  let pathURL: URL
  let previewURL: URL
  let decription: String
}
