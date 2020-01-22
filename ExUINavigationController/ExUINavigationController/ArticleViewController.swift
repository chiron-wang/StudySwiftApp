//
//  ArticleViewController.swift
//  ExUINavigationController
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 底色
        self.view.backgroundColor = .white
        
        // 導覽列標題
        self.title = "Article"
        
        // 導覽列底色
        self.navigationController!.navigationBar.barTintColor = .cyan
        
        // 導覽列是否半透明
        self.navigationController!.navigationBar.isTranslucent = false
        
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ArticleViewController.edit))
        // 加到導覽中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(x: 100, y: 100, width: 120, height: 40))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = .blue
        myButton.addTarget(self, action: #selector(ArticleViewController.back), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func edit() {
        print("edit action")
    }
    
    @objc func back() {
        self.navigationController!.popViewController(animated: true)
    }
    
}
