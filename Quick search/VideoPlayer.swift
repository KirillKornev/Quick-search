//
//  VideoPlayer.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayer {
  
  let url: URL
  
  lazy var player = AVPlayer(url: url)
  
  init(url: URL) {
    self.url = url
  }
  
  func getPlayerViewController() -> AVPlayerViewController {
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    return playerViewController
  }
  
  func playVideo() {
    player.play()
  }
  
}
