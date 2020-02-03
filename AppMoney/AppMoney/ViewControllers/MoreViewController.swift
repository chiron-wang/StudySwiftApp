//
//  MoreViewController.swift
//  AppMoney
//
//  Created by mikewang on 2020/2/3.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fullSize: CGSize = UIScreen.main.bounds.size
    let myUserDefaults = UserDefaults.standard
    let openSound: Int? = 0
    var mySwitch: UISwitch!
    var myTableView: UITableView!
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "關於"
        
        // 建立 UITableView
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: fullSize.height), style: .grouped)
        myTableView.contentInsetAdjustmentBehavior = .never
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.allowsSelection = true
        myTableView.backgroundColor = .black
        myTableView.separatorColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
        self.view.addSubview(myTableView)
    }
    
    // MARK: - IBAction
    
    @objc func goFB() {
        let requestUrl = URL(string: "https://www.facebook.com/swiftgogogo")
        UIApplication.shared.open(requestUrl!, options: [:], completionHandler: nil)
    }
    
    @objc func goIconSource() {
        let requestUrl = URL(string: "https://www.flaticon.com/")
        UIApplication.shared.open(requestUrl!, options: [:], completionHandler: nil)
    }
    
    // MARK: - UITableViewDelegate Methods
    
    // 必須實作的方法：每一組有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let button = UIButton(frame: CGRect(x: 15, y: 0, width: fullSize.width, height: 40))
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        
        if indexPath.section == 0 {
            button.addTarget(self, action: #selector(MoreViewController.goFB), for: .touchUpInside)
            button.setTitle("在 Facebook 上與我們聯絡", for: .normal)
        } else if indexPath.section == 1 {
            button.addTarget(self, action: #selector(MoreViewController.goIconSource), for: .touchUpInside)
            button.setTitle("圖示： FLATICON", for: .normal)
        }
        
        cell.contentView.addSubview(button)
        
        return cell
    }
    
    // 點選 cell 後執行的動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取消 cell 的選取狀態
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 有幾組 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 每個 seciton 的標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = "來源"
        if section == 0 {
            title = "支援"
        }
        
        return title
    }
    
    // section header 樣式
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(red: 0.88, green: 0.83, blue: 0.73, alpha: 1)
    }
}
