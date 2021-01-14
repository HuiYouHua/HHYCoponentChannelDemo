//
//  HomeViewController.swift
//  HomeComponent
//
//  Created by 华惠友 on 2021/1/14.
//

import UIKit
import UserCenterComponent

public class HomeViewController: UIViewController {

    lazy var tableView: UITableView = {
        let t = UITableView()
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    private var source : [String] = []

    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "主页"
        self.view.backgroundColor = .cyan
        
        
        source = ["历史", "VIP", "客服"]
        
        #if APPSTORE_CHANNEL
        source.append("appStore")
        #else
        source.append("enterprise")
        #endif
        
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        
    }

}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        source.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = source[indexPath.row]
            return cell
       
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(UserCenterViewController(), animated: true)
    }
}
