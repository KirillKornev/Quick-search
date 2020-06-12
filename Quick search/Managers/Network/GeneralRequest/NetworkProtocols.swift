//
//  NetworkProtocols.swift
//  Quick search
//
//  Created by Кирилл on 6/12/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import Foundation


struct RequestConfig<Parser> where Parser: IParser {
  let request: URLRequest?
  let parser: Parser
}

protocol IParser {
  associatedtype Model
  func parse(data: Data) -> Model?
}
