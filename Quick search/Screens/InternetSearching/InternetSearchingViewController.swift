//
//  InternetSearchingViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/14/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit
import WebKit

class InternetSearchingViewController: UIViewController {
  
  let activityIndicator = UIActivityIndicatorView(style: .large)
  @IBOutlet weak var searchWebView: WKWebView!
  @IBOutlet weak var searchTextField: UITextField!
  
  private func setActivityIndicator() {
    activityIndicator.center = view.center
    activityIndicator.hidesWhenStopped = true
    view.addSubview(activityIndicator)
  }
  
  private func open(text: String) {
    let someText = "https://"
    if let searchUrl = URL(string: "\(someText)\(text)") {
      let request = URLRequest(url: searchUrl)
      searchWebView.load(request)
    }
  }
  
  @IBAction func goBack(_ sender: Any) {
    searchWebView.goBack()
  }
  
  @IBAction func goForward(_ sender: Any) {
    searchWebView.goForward()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    title = "Web searching" 
    searchTextField.placeholder = "https://"
    searchTextField.delegate = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    open(text: "google.com")
  }
  
}

extension InternetSearchingViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let text = textField.text {
      open(text: text)
    }
    searchTextField.resignFirstResponder()
    return true
  }
}
