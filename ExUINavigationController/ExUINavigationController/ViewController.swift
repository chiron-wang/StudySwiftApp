//
//  ViewController.swift
//  ExUINavigationController
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 底色
        self.view.backgroundColor = .darkGray
        
        // 導覽列標題
        self.navigationController!.navigationBar.barTintColor = .lightGray
        
        // 導覽列是否半透明
        self.navigationController!.navigationBar.isTranslucent = false
        
        // 導覽列左邊按鈕
        let leftButton = UIBarButtonItem(image: UIImage(named: "check"), style: .plain, target: self, action: #selector(ViewController.check))
        // 加到導覽列中
        self.navigationItem.leftBarButtonItem = leftButton
        
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(title: "設定", style: .plain, target: self, action: #selector(ViewController.setting))
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = .blue
        myButton.addTarget(self, action: #selector(ViewController.article), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func article() {
        self.navigationController!.pushViewController(ArticleViewController(), animated: true)
    }
    
    @objc func check() {
        print("check button action")
    }
    
    @objc func setting() {
        self.navigationController!.pushViewController(SettingViewController(), animated: true)
    }


}

