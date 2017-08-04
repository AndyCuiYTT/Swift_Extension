//
//  ViewController.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.cyan
        
        
        
        
        let imageView = UIImageView(frame: self.view.frame)
        
        var image = UIImage.ytt_getImageWithColor(UIColor.brown, size: self.view.frame.size)
        image = image?.ytt_addWaterMarkWithString("AndyCuiYTT", location: CGRect(x: 50, y: 100, width: 100, height: 30), attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName : UIColor.orange])
        
        
        imageView.image = image
        self.view.addSubview(imageView)
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

