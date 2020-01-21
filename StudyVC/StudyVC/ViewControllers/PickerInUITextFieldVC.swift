//
//  PickerInUITextFieldViewController.swift
//  StudyVC
//
//  Created by mikewang on 2020/1/19.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class PickerInUITextFieldVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    // 取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    let meals = ["早餐","午餐","晚餐","宵夜"]
    var formatter: DateFormatter! = nil

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設置背景顏色為白色
        self.view.backgroundColor = .white
        
        // 建立 UIPickerView
        let myPickerView = UIPickerView()
        
        // 設定 UIPickerView 的 delegate 及 dataSource
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        // 建立一個 UITextField
        var myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIPickerView
        myTextField.inputView = myPickerView
        
        // 設置 UITextField 預設的內容
        myTextField.text = meals[0]

        // 設置 UITextField 的 tag 以利後續使用
        myTextField.tag = 100
        
        // 設置 UITextField 其他資訊並放入畫面中
        myTextField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myTextField.textAlignment = .center
        myTextField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15)
        self.view.addSubview(myTextField)
        
        // 建立另一個 UITextField
        myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        
        // 初始化 formatter 並設置日期顯示的格式
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy 年 MM 月 dd 日"
        
        // 建立一個 UIDatePicker
        let myDatePicker = UIDatePicker()
        
        // 設置 UIDatePicker 的格式
        myDatePicker.datePickerMode = .date
        
        // 設置 UIDatePicker 顯示的語言環境
        myDatePicker.locale = Locale(identifier: "zh_TW")
        
        // 設置 UIDatePicker 預設日期為現在日期
        myDatePicker.date = Date()
        
        // 設置 UIDatePicker 改變日期時會執行動作的方法
        myDatePicker.addTarget(self, action: #selector(PickerInUITextFieldVC.datePickerChanged), for: .valueChanged)
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIDatePicker
        myTextField.inputView = myDatePicker
        
        // 設置 UITextField 的 tag 以利後續使用
        myTextField.tag = 200
        
        // 設置 UITextField 其他資訊並放入畫面中
        myTextField.backgroundColor = .init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        myTextField.textAlignment = .center
        myTextField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.25)
        self.view.addSubview(myTextField)
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(PickerInUITextFieldVC.hideKeyboard(tagG:)))
        
        tap.cancelsTouchesInView = false
        
        // 加入最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
    }
    
    // MARK: - UIPickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 返回陣列 meals 的成員數量
        return meals.count
    }
    
    // UIPickerView 每個選項顯示的資料
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 設置為陣列 meals 的第 row 項資料
        return meals[row]
    }
    
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 依據元件的 tag 取得 UITextField
        let myTextField = self.view?.viewWithTag(100) as? UITextField
        
        // 將 UITextField 的值更新為陣列 meals 的第 row 項資料
        myTextField?.text = meals[row]
    }
    
    // UIDatePicker 改變選擇時執行的動作
    @objc func datePickerChanged(datePicker: UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        let myTextField = self.view?.viewWithTag(200) as? UITextField
        
        // 將 UITextField 的值更新為新的日期
        myTextField?.text = formatter.string(from: datePicker.date)
    }
    
    // 按空白處會隱藏編輯狀態
    @objc func hideKeyboard(tagG: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }


}
