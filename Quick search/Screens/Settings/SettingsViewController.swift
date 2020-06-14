//
//  PictureSettingsViewController.swift
//  Quick search
//
//  Created by Кирилл on 6/11/20.
//  Copyright © 2020 Kornev.com. All rights reserved.
//

import UIKit

protocol SettingsViewDelegate {
  func sendInfo(number: Int, theme: String)
}

class SettingsViewController: UIViewController {
  
  var delegate: SettingsViewDelegate?
  
  @IBOutlet weak var numberOfPicturesPicker: UIPickerView!
  @IBOutlet weak var numberOfPicturesLabel: UILabel!
  @IBOutlet weak var themeLabel: UILabel!
  
  lazy var number = numberArray[0]
  lazy var theme = themesArray[0]
  
  @IBAction func saveButton(_ sender: UIButton) {
    delegate?.sendInfo(number: number, theme: theme)
    self.dismiss(animated: true, completion: nil)
  }
  let numberArray = [5, 10, 15, 20, 25, 30, 40, 50, 70, 90, 100]
  let themesArray = ["Nature", "Cars", "Sport", "Phones", "Food", "Weather", "Hi-Tech", "Abstraction", "Aviation", "City", "Girls", "Painting", "Animals", "Games", "Interior", "Space", "Cats", "Macro", "Machines", "Minimalism", "Men", "Music", "Moods", "Holidays", "Miscellaneous", "Rendering", "Situations", "Dogs", "Sport", "Style", "Textures", "Fiction", "Movies", "Flowers"]
  
  override func viewDidLoad() {
        super.viewDidLoad()
    numberOfPicturesPicker.dataSource = self
    numberOfPicturesPicker.delegate = self
    setDefaultValues(with: number, text: theme)
    }
  
  private func setDefaultValues(with number: Int, text: String) {
    numberOfPicturesLabel.text = "Number of pictures: \(number)"
    themeLabel.text = "Theme: \(theme)"
  }
  
  private func setPictureCount(count: Int) {
    self.number = count
    setDefaultValues(with: number, text: theme)
  }
  
  private func setTheme(theme: String) {
    self.theme = theme
    setDefaultValues(with: number, text: theme)
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
      return String(numberArray[row])
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
