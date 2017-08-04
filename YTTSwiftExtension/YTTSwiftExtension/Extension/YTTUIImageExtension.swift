//
//  YTTUIImageExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 根据颜色创建图片
    ///
    /// - Parameters:
    ///   - color: 图片颜色
    ///   - size: 图片大小
    /// - Returns: 纯色图片
    class func ytt_getImageWithColor(_ color: UIColor, size: CGSize) -> UIImage?{
        return color.ytt_toImage(size)
    }
    
    
    /// 修改图片 size
    ///
    /// - Parameter size: 修改后的 size
    /// - Returns: 修改后的图片
    func ytt_resetImageSize(newSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 按比例修改图片 size
    ///
    /// - Parameter scale: 缩放比例
    /// - Returns: 修改后的图片
    func ytt_resetImageSizeWithScale(_ scale: CGFloat) -> UIImage? {
        let newSize = CGSize(width: self.size.width * scale, height: self.size.height * scale)
        return ytt_resetImageSize(newSize: newSize)
    }
    
    /// 固定宽度自适应高度
    ///
    /// - Parameter width: 图片宽度
    /// - Returns: 修改后的图片
    func ytt_resetImageSizeWithWidth(_ width: CGFloat) -> UIImage? {
        let scale = width / self.size.width
        return ytt_resetImageSize(newSize: CGSize(width: width, height: self.size.height * scale))
    }
    
    /// 固定高度自适应宽度
    ///
    /// - Parameter height: 图片高度
    /// - Returns: 修改后图片
    func ytt_resetImageSizeWithHeight(_ height: CGFloat) -> UIImage? {
        let scale = height / self.size.height
        return ytt_resetImageSize(newSize: CGSize(width: self.size.width * scale, height: height))
    }
    
    
    /// 将 image 转化为 base64字符串
    ///
    /// - Returns: image 转化后的字符串
    func ytt_toBase64String() -> String {
        let imageData = UIImagePNGRepresentation(self)
        return (imageData?.base64EncodedString(options: .endLineWithLineFeed))!
    }
    
    /// 将 base64字符串转化为 Image
    ///
    /// - Parameter string: base64 字符串
    /// - Returns: 转化后的图片
    class func ytt_getImageWithBase64String(imageString string: String) -> UIImage {
        let imageData = Data(base64Encoded: string, options: .init(rawValue: 0))
        return UIImage(data: imageData)
    }
    
    
    
    
    
    
    
}
