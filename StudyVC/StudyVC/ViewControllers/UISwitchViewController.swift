//
//  UISwitchViewController.swift
//  StudyVC
//
//  Created by mikewang on 2020/1/20.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class UISwitchViewController: UIViewController {
    // 取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改背景顏色為白色
        self.view.backgroundColor = .white

        // 建立一個 UISwitch
        var mySwitch = UISwitch()
        
        // 設置位置並放入畫面中
        mySwitch.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(mySwitch)
        
        // 建立另一個 UISwitch
        mySwitch = UISwitch()
        
        // 設置懷滑桿鈕的顏色
        mySwitch.thumbTintColor = .orange
        
        // 設置未選取時( off )的外觀顏色
        mySwitch.tintColor = .blue
        
        // 設置選取時( on )的外觀顏色
        mySwitch.onTintColor = .brown
        
        // 設置切換 UISwitch 時執行的動作
        mySwitch.addTarget(self, action: #selector(UISwitchViewController.onChange), for: .valueChanged)
        
        // 設置位置並放入畫面中
        mySwitch.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(mySwitch)
    }
    
    // UISwitch 切換時 執行動作的方法
    @objc func onChange(_ sender: AnyObject) {
        // 取得這個 UISwitch 元件
        let tempSwitch = sender as! UISwitch
        
        // 依據屬性 isOn 來為底色變色
        if tempSwitch.isOn {
            self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    
    
}
