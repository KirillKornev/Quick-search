//
//  VideoViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Videos"
      tableView.dataSource = self
      tableView.delegate = self
      setupTableViewCell()
      tableView.estimatedRowHeight = 400
      tableView.rowHeight = UITableView.automaticDimension
    }
  
  func setupTableViewCell() {
    let nibCell = UINib(nibName: String(describing: VideoCell.self), bundle: nil)
    tableView.register(nibCell, forCellReuseIdentifier: String(describing: VideoCell.self))
  }

}

extension VideoViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoCell.self), for: indexPath) as? VideoCell else { return UITableViewCell()}
    let image = UIImage(named: "search2")
    cell.configureCell(text: "\(indexPath)", image: image!)
    return cell
  }
  
  
}
