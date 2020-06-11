//
//  VideoViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
  
  var videos = [VideoModel]()
  
  let fetchManager: RequstManagerProtocol = RequstManager()
  
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
      getVideoList()
    }
  
  func getVideoList() {
    fetchManager.loadVideoList { (videoList, error) in
      guard let unwrapVideos = videoList else { return }
      self.videos = unwrapVideos
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
    //open video

  }
  
  
}

extension VideoViewController: SettingsViewDelegate {
  func sendNumberOfItems(number: String) {
    print("picture VC get \(number)")
  }
  
  func sendTheme(theme: String) {
    print("picture VC get \(theme)")
  }
  
}
