//
//  ViewController.swift
//  ExMultiPages
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 取得螢幕尺寸
    let fullSize = UIScreen.main.bounds.size

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定背景顏色為白色
        self.view.backgroundColor = .white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "首頁"
        self.view.addSubview(myLabel)
        
        // 建立前往 Article 頁面的 UIButton
        var myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.addTarget(nil, action: #selector(ViewController.goArticle), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myButton)
        
        // 建立前往 Intro 頁面的 UIButton
        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Intor", for: .normal)
        myButton.backgroundColor = .lightGray
        myButton.addTarget(nil, action: #selector(ViewController.goIntro), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
        
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
    
    @objc func goArticle() {
        self.present(ArticleViewController(), animated: true, completion: nil)
    }
    
    @objc func goIntro() {
        self.present(IntroViewController(), animated: true, completion: nil)
    }


}

