//
//  TopicViewController.swift
//  SwiftNews
//
//  Created by GY.Z on 2017/9/12.
//  Copyright © 2017年 deepbaytech. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController {

    var topicTitle: TopicTitle?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.randomColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
