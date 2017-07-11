//
//  ViewController.swift
//  Swift_Extension
//
//  Created by Andy on 2017/7/10.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let label = UILabel.ay_getLabel("123").ay_setFont(UIFont.systemFont(ofSize: 12)).ay_setFrame(CGRect(x: 0, y: 40, width: 100, height: 30))
        self.view.addSubview(label)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

