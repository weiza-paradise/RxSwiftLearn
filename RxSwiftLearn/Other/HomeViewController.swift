//
//  HomeViewController.swift
//  rxswiftLearn
//
//  Created by mac on 2022/8/25.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let listInfo = HomeViewModel().homeListData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RootCell", for: indexPath)
        let classInfo = listInfo[indexPath.row]
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.magenta : UIColor.yellow
        cell.textLabel?.text = classInfo.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let info = listInfo[indexPath.row]
        if info.isStoryboard {
            let sb = UIStoryboard(name: info.storyboardName, bundle: nil)
            let vcName = NSStringFromClass(info.class)
            print(vcName)
            let vc = sb.instantiateViewController(withIdentifier: info.storyboardId)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if !info.link.isEmpty {
            let webView = WebViewController()
            webView.startUrl = info.link
            webView.titleStr = info.name
            navigationController?.pushViewController(webView, animated: true)
            
        }
    }
    
}
