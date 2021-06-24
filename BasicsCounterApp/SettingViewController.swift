//
//  SettingViewController.swift
//  BasicsCounterApp
//
//  Created by hideto c. on 2021/06/21.
//

import UIKit

class SettingViewController: UIViewController {
    
    // UIPickerViewに表示するデータをArrayで作成
    let settingArray: [Int] = [10, 20, 30, 40, 50, 60]
    // 設定値を覚えるキー
    let settingKey = "timer_value"
    
    @IBOutlet private weak var timerSettingPicker: UIPickerView!
    @IBOutlet private weak var deciedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        // UserDefaultsの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        // Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
        
        setupButton()
    }
    
    @IBAction func decisionButtonAction(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    private func setupButton() {
        deciedButton.layer.cornerRadius = 50
    }
}

extension SettingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    // UIPickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    // picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // UserDefaultsの設定
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }
}
