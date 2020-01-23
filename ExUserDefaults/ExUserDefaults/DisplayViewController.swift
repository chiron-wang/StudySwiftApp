//
//  DisplayViewController.swift
//  ExUserDefaults
//
//  Created by mikewang on 2020/1/23.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()

        // 設定背景顏色為白色
        self.view.backgroundColor = .white
        
        // 取得儲存的預設資料
        let myUserDefaults = UserDefaults.standard
        
        // 顯示儲存資訊的 UILabel
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.textColor = .brown
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.25)
        
        if let info = myUserDefaults.object(forKey: "info") as? String {
            myLabel.text = info
        } else {
            myLabel.text = "尚未儲存資訊"
            myLabel.textColor = .red
        }
        
        self.view.addSubview(myLabel)
    }
    
}
