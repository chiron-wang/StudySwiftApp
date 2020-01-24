//
//  ViewController.swift
//  ExSound
//
//  Created by mikewang on 2020/1/24.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var myPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定背景顏色為白色
        self.view.backgroundColor = .white
        
        // 建立播放器
        let soundPath = Bundle.main.path(forResource: "woohoo", ofType: "wav")
        do {
            myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath!))
            
            // 重設播放次數 設為 0 則是只播放一次 不重複
            myPlayer.numberOfLoops = 0
        } catch {
            print("error")
        }
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 60))
        myButton.setTitle("音效", for: .normal)
        myButton.setTitleColor(.blue, for: .normal)
        myButton.addTarget(self, action: #selector(ViewController.play), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func play() {
        // 播放音效
        myPlayer.play()
    }


}

