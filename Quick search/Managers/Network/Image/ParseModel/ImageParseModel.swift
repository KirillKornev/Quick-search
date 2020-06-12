//
//  ImageModel.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation

struct ImageDescriptionModel: Decodable {
  let total: Int
  let totalHits: Int
  let hits: [Image]
}

struct Image: Decodable {
  let webformatURL: URL
}

struct ImageModel {
  let pathURL: URL
}


