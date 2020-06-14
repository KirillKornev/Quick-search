//
//  GeneralPictureRequest.swift
//  Quick search
//
//  Created by Кирилл on 6/14/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation


class PictureGeneralRequest {
  var urlRequest: URLRequest?
  init(url: URL) {
    urlRequest = URLRequest(url: url)
  }
}
