//
//  GYTabBarController.swift
//  SwiftNews
//
//  Created by GY.Z on 2017/9/11.
//  Copyright © 2017年 deepbaytech. All rights reserved.
//

import UIKit

class GYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViewControllers() {
        addChildViewControllers(childController: GYHomeController(), title: "首页", imageNamed: "home_tabbar_32x32_", selectImageNamed: "home_tabbar_press_32x32_")
        addChildViewControllers(childController: GYVideoController(), title: "视频", imageNamed: "video_tabbar_32x32_", selectImageNamed: "video_tabbar_press_32x32_")
        addChildViewControllers(childController: GYToutiaoController(), title: "微头条", imageNamed: "weitoutiao_tabbar_32x32_", selectImageNamed: "weitoutiao_tabbar_press_32x32_")
        addChildViewControllers(childController: GYMineController(), title: "未登录", imageNamed: "no_login_tabbar_32x32_", selectImageNamed: "no_login_tabbar_press_32x32_")
    }
    
    private func addChildViewControllers(childController:UIViewController,title:String,imageNamed:String,selectImageNamed:String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named:imageNamed)
        childController.tabBarItem.selectedImage = UIImage(named:selectImageNamed)
        let nav = GYNavigationController.init(rootViewController: childController)
        addChildViewController(nav)
    }
    
    
    

}
