//
//  YTTTableViewExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

extension UITableView {
    func ytt_dequeueOrInitCell(nibName: String, identifier:String) -> UITableViewCell {
        // 需要在 xib 设置 Identifier
        var cell = self.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first! as? UITableViewCell
            cell?.selectionStyle = .none
        }
        return cell!
    }
}
