//
//  VideoViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
  
  var numberOfItems = 5
  var theme = "Nature"
  
  let check = CheckInternetConnection()
  
  var videos = [VideoModel]()
  
  let fetchManager: RequstManagerProtocol = RequstManager()
  
  let videoManager = FetchVideosManager()
  
  let assembly: ControllerBuilderProtocol = ControllerBuilder()
  
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Videos"
      tableView.dataSource = self
      tableView.delegate = self
      setupTableViewCell()
      tableView.estimatedRowHeight = 400
      tableView.rowHeight = UITableView.automaticDimension
      createBarItems()
      getVideoList(number: 5, theme: "Weather")
      check.checkConnection { (result) in
        if result == false {
          DispatchQueue.main.async {
            Alert.showFailurInternetConnectionAlert(on: self) {
              print("try later")
            }
          }
        }
      }
    }
  
  func getVideoList(number: Int, theme: String) {
    videoManager.fetchVideosUrls(number: numberOfItems, theme: theme) { (videoList) in
      self.videos = videoList
      print("yeah")
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    
  }
  
  func setupTableViewCell() {
    let nibCell = UINib(nibName: String(describing: VideoCell.self), bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: String(describing: VideoCell.self))
  }
  
  private func createBarItems() {
    let rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(goToSettings))
    self.navigationItem.rightBarButtonItem  = rightBarButtonItem
  }
  
  @objc
   func goToSettings() {
    let controller = assembly.getSettingController()
    controller.delegate = self
    present(controller, animated: true, completion: nil)
  }
}

//MARK:- Extension
extension VideoViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoCell.self), for: indexPath) as? VideoCell else { return UITableViewCell()}
    if videos.count != 0 {
      cell.deletePicture()
      let url = videos[indexPath.row].previewURL
      let description = videos[indexPath.row].decription
      cell.deletePicture()
        fetchManager.loadPicture(url: url) { (image, error) in
          guard let image = image else { return }
          DispatchQueue.main.async {
            cell.configureCell(text: description, image: image)
          }
      }
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let url = videos[indexPath.row].pathURL
    let player = VideoPlayer(url: url)
    let playerController = player.getPlayerViewController()
    present(playerController, animated: true) {
      player.playVideo()
    }
  }
}

extension VideoViewController: SettingsViewDelegate {
  
  func sendInfo(number: Int, theme: String) {
    getVideoList(number: 5, theme: theme)
  }
  
}
