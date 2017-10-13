//
//  GYAdvertiseController.swift
//  SwiftNews
//
//  Created by GY.Z on 2017/9/11.
//  Copyright © 2017年 deepbaytech. All rights reserved.
//

import UIKit

class GYAdvertiseController: UIViewController {

    private var time:TimeInterval = 4.0
    
    private var countdownTimer: Timer?

    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var advertiseView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipButton.setTitle(String(format:"%.0f s跳过",time), for: UIControlState.normal)
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

        advertiseView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(advertiseViewTap))
    
        advertiseView.addGestureRecognizer(tap)
        
    }
    
    func advertiseViewTap(){
        print("点击广告")
        
    }
    
    func updateTime() {
        if time == 0 {
            countdownTimer?.invalidate()
            let tabbar = GYTabBarController()
            UIApplication.shared.keyWindow?.rootViewController = tabbar
        }else{
            time-=1
            skipButton.setTitle(String(format:"%.0f s跳过",time), for: UIControlState.normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func skipAction(_ sender: UIButton) {
        countdownTimer?.invalidate()
        let tabbar = GYTabBarController()
        UIApplication.shared.keyWindow?.rootViewController = tabbar
    }
    
    
}
