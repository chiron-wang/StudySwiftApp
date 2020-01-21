//
//  UIStepperViewController.swift
//  StudyVC
//
//  Created by mikewang on 2020/1/21.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class UIStepperVC: UIViewController {
    // 取得螢幕尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    var myLabel: UILabel!
    var myStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 將背景顏色設定為白色
        self.view.backgroundColor = .white
        
        // 建立一個 UILabel
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        myLabel.text = "0"
        myLabel.textColor = .black
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(myLabel)
        
        // 建立一個 UIStepper
        myStepper = UIStepper()
        
        // UIStepper 預設值
        myStepper.value = 0
        
        // UIStepper 最小值
        myStepper.minimumValue = 0
        
        // UIStepper 最大值
        myStepper.maximumValue = 100
        
        // UIStepper 每按一次按鈕 增減的數量
        myStepper.stepValue = 2
        
        // UIStepper 是否可按者增減按鈕持續變化數值
        myStepper.autorepeat = true
        
        // UIStepper 是否可以在變動時同步執行動作
        // 設定 false 時 則是放開按鈕後才會執行動作
        myStepper.isContinuous = true
        
        // UIStepper 數值是否可以循環
        // 例如填 true 時 如果值已達到最大值
        // 再按一次 + 會循環到最小值繼續增加
        myStepper.wraps = true
        
        // UIStepper 按下增減按鈕後 執行的動作
        myStepper.addTarget(self, action: #selector(UIStepperVC.onStepperChange), for: .valueChanged)
        
        // 設值 UIStepper 位置並放入畫面中
        myStepper.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(myStepper)
    }
    
    @objc func onStepperChange() {
        // 將 UILabel 的值設值為UIStepper 目前的值
        myLabel.text = "\(myStepper.value)"
    }
    
}
