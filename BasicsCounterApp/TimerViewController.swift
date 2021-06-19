//
//  TimerViewController.swift
//  BasicsCounterApp
//
//  Created by hideto c. on 2021/06/20.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }

    private func setupButton() {
        startButton.layer.cornerRadius = 65
        stopButton.layer.cornerRadius = 65
    }
}

