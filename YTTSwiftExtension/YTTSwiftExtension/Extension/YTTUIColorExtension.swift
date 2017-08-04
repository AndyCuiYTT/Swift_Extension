//
//  YTTUIColorExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 将颜色转化为纯色图片
    ///
    /// - Parameter size: 图片大小
    /// - Returns: 转化后的图片
    func ytt_toImage(_ size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? nil
    }
    
    
    /// 利用 RGB 进行设置颜色
    ///
    /// - Parameters:
    ///   - R: 色值
    ///   - G: 色值
    ///   - B: 色值
    ///   - alpha: 透明度
    /// - Returns: RGB 对应颜色
    class func ytt_colorWithRGB(R: CGFloat, G: CGFloat, B: CGFloat, alpha: CGFloat? = 1) -> UIColor{
        
        if #available(iOS 10.0, *){
            return UIColor(displayP3Red: CGFloat(R / 255.0), green: G / 255.0, blue: B / 255.0, alpha: alpha!)
        }else {
            return UIColor.init(red: R / 255.0, green: G / 255.0, blue: B / 255.0, alpha: alpha!)
        }
    }
    
    /// 设置16进制色值
    ///
    /// - Parameters:
    ///   - rgbValue: 16进制色值 例如:0xFFFFFF
    ///   - alpha: 透明度
    /// - Returns: 色值对应颜色
    class func ytt_colorWithHex(rgbValue: NSInteger, alpha: CGFloat? = 1) -> UIColor {
        
        if #available(iOS 10.0, *){
            return UIColor(displayP3Red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: alpha!)
        }else {
            return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: alpha!)
        }
    }


}
