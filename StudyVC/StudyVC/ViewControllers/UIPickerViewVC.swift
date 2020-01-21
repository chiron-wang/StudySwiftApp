//
//  UIPickerViewViewController.swift
//  StudyVC
//
//  Created by mikewang on 2020/1/19.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class UIPickerViewVC: UIViewController {
    // 取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定背景顏色為白色
        self.view.backgroundColor = .white

        // 建立 UIPickerView 設置位置及尺寸
        let myPickerView = UIPickerView(frame: CGRect(x: 0, y: fullScreenSize.height * 0.3, width: fullScreenSize.width, height: 200))
        
        // 新增另一個 UIViewController
        // 用來實作委任模式的方法
        let myViewController = MyViewController()
        
        // 必須將這個 UIViewController 加入
        self.addChild(myViewController)
        
        // 設定 UIPickerView 的 delegate 及 dataSource
        myPickerView.delegate = myViewController
        myPickerView.dataSource = myViewController
        
        // 加入到畫面
        self.view.addSubview(myPickerView)
    }
    
    
}
