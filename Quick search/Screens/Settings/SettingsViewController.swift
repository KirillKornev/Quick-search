//
//  PictureSettingsViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate {
  func sendNumberOfItems(number: String)
  func sendTheme(theme: String)
}

class SettingsViewController: UIViewController {
  
  var delegate: SettingsViewDelegate?
  
  @IBOutlet weak var numberOfPicturesPicker: UIPickerView!
  @IBOutlet weak var numberOfPicturesLabel: UILabel!
  @IBOutlet weak var themeLabel: UILabel!
  
  lazy var number = numberArray[0]
  lazy var theme = themesArray[0]
  
  @IBAction func saveButton(_ sender: UIButton) {
    delegate?.sendTheme(theme: theme)
    delegate?.sendNumberOfItems(number: number)
  }
  
  let numberArray = ["5", "10", "15", "20", "25", "30"]
  let themesArray = ["Nature", "Cars", "Sport", "Phones", "Food", "Weather"]
  
  override func viewDidLoad() {
        super.viewDidLoad()
    numberOfPicturesPicker.dataSource = self
    numberOfPicturesPicker.delegate = self
    setDefaultValues()
    }
  
  private func setDefaultValues() {
    numberOfPicturesLabel.text = "Number of pictures:"
    themeLabel.text = "Theme:"
  }
  
  private func setPictureCount(count: String) {
    numberOfPicturesLabel.text = "Number of pictures: \(count)"
    self.number = count
  }
  
  private func setTheme(theme: String) {
    themeLabel.text = "Theme: \(theme)"
    self.theme = theme
  }

}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0:
      return numberArray.count
    case 1:
      return themesArray.count
    default:
      return 0
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0 {
      return numberArray[row]
    } else {
      return themesArray[row]
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      setPictureCount(count: numberArray[row])
    } else {
      setTheme(theme: themesArray[row])
    }
    
  }
  
}
