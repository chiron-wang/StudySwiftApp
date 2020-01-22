//
//  SettingViewController.swift
//  ExUINavigationController
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 底色
        self.view.backgroundColor = .black
        
        // 導覽列標題
        self.title = "Setting"
        
        // 導覽列底色
        self.navigationController!.navigationBar.barTintColor = .white
        
        // 導覽列是否半透明
        self.navigationController!.navigationBar.isTranslucent = false
        
        // 導覽列右邊 UIView
        let myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        myUIView.backgroundColor = .purple
        let rightButton = UIBarButtonItem(customView: myUIView)
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(x: 100, y: 250, width: 120, height: 40))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = .blue
        myButton.addTarget(self, action: #selector(SettingViewController.back), for: .touchUpInside)
        self.view.addSubview(myButton)        
    }

    @objc func back() {
        self.navigationController!.popViewController(animated: true)
    }

}
