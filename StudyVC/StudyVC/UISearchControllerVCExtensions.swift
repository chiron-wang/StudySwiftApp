//
//  UISearchControllerVCExtensions.swift
//  StudyVC
//
//  Created by mikewang on 2020/1/21.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

extension UISearchControllerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchArr.count
        } else {
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if searchController.isActive {
            cell.textLabel?.text = searchArr[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = cities[indexPath.row]
            return cell
        }
    }
}

extension UISearchControllerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            print("你選擇的是 \(searchArr[indexPath.row])")
        } else {
            print("你選擇的是 \(cities[indexPath.row])")
        }
    }
}

extension UISearchControllerVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // 取得搜尋文字
        guard let searchText = searchController.searchBar.text else { return }
        
        searchArr = cities.filter({ (city) -> Bool in
            return city.contains(searchText)
        })
    }
}
