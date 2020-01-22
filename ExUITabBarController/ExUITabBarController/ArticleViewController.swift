//
//  ArticleViewController.swift
//  ExUITabBarController
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()

        // 建立一個 UILabel
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        myLabel.backgroundColor = .lightGray
        myLabel.text = "Article 文章頁"
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myLabel)
    }

}
