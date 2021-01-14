//
//  HomeViewController.swift
//  HomeComponent
//
//  Created by 华惠友 on 2021/1/14.
//

import UIKit
import UserCenterComponent
import SnapKit

public class HomeViewController: UIViewController {

    lazy var tableView: UITableView = {
        let t = UITableView()
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    private var source : [String] = []

    private lazy var imageView: UIImageView = {
        return UIImageView(image: UIImage.currentBundle("login_qq_icon"))
    }()
    
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
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(400)
        }
        
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
