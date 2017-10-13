//
//  NetworkTool.swift
//  SwiftNews
//
//  Created by GY.Z on 2017/9/12.
//  Copyright © 2017年 deepbaytech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

protocol NetworkToolProtocol {
    /// -------------------------- 首 页 home -------------------------
    /// 获取首页顶部标题内容
    static func loadHomeTitlesData(fromViewController: String,completionHandler:@escaping(_ topTitles:[TopicTitle],_ homeTopicVCs:[TopicViewController])->())
    
    
    
}

class NetworkTool: NetworkToolProtocol {
    /// -------------------------- 首 页 home -------------------------
    /// 获取首页顶部标题内容
    static func loadHomeTitlesData(fromViewController: String, completionHandler: @escaping ([TopicTitle], [TopicViewController]) -> ()) {
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        let params = ["device_id":device_id,
                      "aid": 13,
                      "iid": IID] as [String:AnyObject]
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
//            print(response.result.value)
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    var titles = [TopicTitle]()
                    var homeTopicVCs = [TopicViewController]()
                    // 添加推荐标题
                    let recommendDict = ["category": "", "name": "推荐"]
                    let recommend = TopicTitle(dict: recommendDict as [String : AnyObject])
                    titles.append(recommend)
                    // 添加控制器
                    let firstVC = TopicViewController()
                    firstVC.topicTitle = recommend
                    homeTopicVCs.append(firstVC)
                    for dict in data {
                        let topicTitle = TopicTitle(dict: dict as! [String: AnyObject])
                        titles.append(topicTitle)
                        let homeTopicVC = TopicViewController()
                        homeTopicVC.topicTitle = topicTitle
                        homeTopicVCs.append(homeTopicVC)
                    }
                    completionHandler(titles, homeTopicVCs)
                }
            }
        }
    }


    
    
    
}
