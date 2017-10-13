//
//  GYHomeController.swift
//  SwiftNews
//
//  Created by GY.Z on 2017/9/11.
//  Copyright © 2017年 deepbaytech. All rights reserved.
//

import UIKit
import SnapKit

class GYHomeController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置导航栏颜色
        navigationController?.navigationBar.barTintColor = UIColor.myColor(r: 203, g: 68, b: 75, a: 1)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.globalBackgroundColor()
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        // 自定义导航栏
        navigationItem.titleView = homeNavigationBar
        automaticallyAdjustsScrollViewInsets = false

        /// 获取标题数据
        NetworkTool.loadHomeTitlesData(fromViewController: String(describing:GYHomeController.self)) { (topicTitles, homeTopicVCs) in
            // 将所有子控制器添加到父控制器中
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
            }
            self.setupUI()
            
            self.pageView.titles = topicTitles
            self.pageView.childVcs = self.childViewControllers as? [TopicViewController]
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        return pageView
    }()
    // 自定义导航栏
    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar()
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    
}

extension GYHomeController {
    
    fileprivate func setupUI() {
        
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

// MARK: - UITextFieldDelegate
extension GYHomeController: UITextFieldDelegate {
    /// UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(HomeSearchViewController(), animated: false)
        return true
    }
}
