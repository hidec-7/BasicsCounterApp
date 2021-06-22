//
//  TimerViewController.swift
//  BasicsCounterApp
//
//  Created by hideto c. on 2021/06/20.
//

import UIKit

class TimerViewController: UIViewController {
    
    // タイマーの変数
    private var timer: Timer?
    // カウント（経過時間）の変数
    private var count = 0
    // 設定値を扱うキー
    private let settingKey = "timer"
        
    @IBOutlet private weak var countDownLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTimer()
        setupButton()
    }
    
    // 画面の切り替えのタイミングで処理を行う
    override func viewDidAppear(_ animated: Bool) {
        // カウント（経過時間）を0にする
        count = 0
        // タイマーの表示を更新する
        _ = displayUpdate()
    }
    
    @IBAction private func settingButtonAction(_ sender: UIBarButtonItem) {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // 画面遷移
        performSegue(withIdentifier: "settingVC", sender: nil)
    }
    
    @IBAction private func startButtonAction(_ sender: UIButton) {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    // 経過時間の処理
    @objc private func timerInterrupt(_ timer: Timer) {
        // count(経過時間)に+1していく
        count += 1
        // remainCount(残り時間)が0以下のとき、タイマーを止める
        if displayUpdate() <= 0 {
            // 初期化処理
            count = 0
            // タイマー停止
            timer.invalidate()
        }
    }
    
    @IBAction private func stopButtonAction(_ sender: UIButton) {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
    }
    
    private func settingTimer() {
        // UserDefaultsのインスタンス
        let settings = UserDefaults.standard
        // UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey: 10])
    }

    private func setupButton() {
        startButton.layer.cornerRadius = 65
        stopButton.layer.cornerRadius = 65
    }
    
    // 画面の更新をする（戻り値： remainCount: 残り時間）
    private func displayUpdate() -> Int {
        // UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        // 取得した秒数をtimerValueに渡す
        let timerValue = settings.integer(forKey: settingKey)
        // 残り時間（remainCount）を生成
        let remainCount = timerValue - count
        // remainCount(残りの時間)をラベルに表示
        countDownLabel.text = "\(remainCount)"
        // 残り時間を戻り値に設定
        return remainCount
    }
}

