//
//  ArticleDetailViewController.swift
//  ExMultiPages
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    // 取得螢幕尺寸
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()

        // 設置背景顏色為白色
        self.view.backgroundColor = .white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Article Detail 頁"
        self.view.addSubview(myLabel)
        
        // 返回 Article 頁的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.addTarget(nil, action: #selector(ArticleDetailViewController.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        self.view.addSubview(myButton)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
