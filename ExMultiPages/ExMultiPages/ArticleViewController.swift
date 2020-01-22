//
//  ArticleViewController.swift
//  ExMultiPages
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    // 取得螢幕尺寸
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()

        // 設定畫面顏色為白色
        self.view.backgroundColor = .white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Article 頁"
        self.view.addSubview(myLabel)
        
        // 建立前往 Detail 頁面的 UIButton
        var myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Detail", for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.addTarget(nil, action: #selector(ArticleViewController.goDetail), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.3)
        self.view.addSubview(myButton)
        
        // 返回主頁面的 UIButton
        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.addTarget(nil, action: #selector(ArticleViewController.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        self.view.addSubview(myButton)
    }
    
    @objc func goDetail() {
        self.present(ArticleDetailViewController(), animated: true, completion: nil)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
