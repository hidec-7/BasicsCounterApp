//
//  SettingViewController.swift
//  BasicsCounterApp
//
//  Created by hideto c. on 2021/06/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet private weak var decideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    private func setupButton() {
        decideButton.layer.cornerRadius = 50
    }
}
