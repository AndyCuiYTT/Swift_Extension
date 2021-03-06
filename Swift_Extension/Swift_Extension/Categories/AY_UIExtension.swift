//
//  AY_UIExtension.swift
//
//  Created by Andy on 2017/6/30.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//


/**
 * 
 *  采用链式方式设置 view 的属性
 *
 */

import UIKit

// 宽高相关
fileprivate var kScreenWidth = UIScreen.main.bounds.width
fileprivate var kScreenHeight = UIScreen.main.bounds.height
fileprivate var kTextFont = UIFont.systemFont(ofSize: 13)
fileprivate var kTextColor = UIColor.lightGray


// MARK: UILabel
extension UILabel {
    
    /// 创建 label 对象,设置初始值:font,textColor
    ///
    /// - Parameter title: label 显示内容
    /// - Returns: 当前 label 对象
    class func ay_getLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = kTextFont
        label.textColor = kTextColor
        return label
    }
    
    /// 设置 label 文字颜色
    ///
    /// - Parameter textColor: 文字颜色
    /// - Returns: 当前 label 对象
    func ay_setTextColor(_ textColor: UIColor) -> UILabel {
        self.textColor = textColor
        return self
    }

    /// 设置 label 文字字体
    ///
    /// - Parameter font: 文字字体
    /// - Returns: 当前 label 对象
    func ay_setFont(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    /// 设置 label frame
    ///
    /// - Parameter frame: label frame
    /// - Returns:  当前 label 对象
    func ay_setFrame(_ frame: CGRect) -> UILabel {
        self.frame = frame
        return self
    }
    
    /// 设置文字对齐样式
    ///
    /// - Parameter textAlignment: 文字对齐样式
    /// - Returns: 当前 label 对象
    func ay_setTextAlignment(_ textAlignment: NSTextAlignment) -> UILabel {
        self.textAlignment = textAlignment
        return self
    }
    
}


// MARK: UITextLabel
extension UITextField {
    
    class func ay_getTextField(_ placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = kTextFont
        textField.textColor = kTextColor
        return textField
    }
    
    func ay_setTextColor(_ textColor: UIColor) -> UITextField {
        self.textColor = textColor
        return self
    }
    
    func ay_setFont(_ font: UIFont) -> UITextField {
        self.font = font
        return self
    }
    
    func ay_setFrame(_ frame: CGRect) -> UITextField {
        self.frame = frame
        return self
    }
    
    func ay_setTextAlignment(_ textAlignment: NSTextAlignment) -> UITextField {
        self.textAlignment = textAlignment
        return self
    }
    
    func ay_setBorderStyle(_ borderStyle: UITextBorderStyle) -> UITextField {
        self.borderStyle = borderStyle
        return self
    }
    
}

// MARK: UIButton
extension UIButton {
    
    func ay_setFrame(_ frame: CGRect) -> UIButton {
        self.frame = frame
        return self
    }
    
    func ay_setNormalTitle(_ title: String) -> UIButton {
        self.setTitle(title, for: .normal)
        return self
    }
    
    func ay_setHighlightedTitle(_ title: String) -> UIButton {
        self.setTitle(title, for: .highlighted)
        return self
    }
    
    func ay_setSelectedTitle(_ title: String) -> UIButton {
        self.setTitle(title, for: .selected)
        return self
    }
    
    func ay_setNormalImage(_ imageName: String) -> UIButton {
        self.setImage(UIImage(named: imageName), for: .normal)
        return self
    }
    
    func ay_setSelectedImage(_ imageName: String) -> UIButton {
        self.setImage(UIImage(named: imageName), for: .selected)
        return self
    }
    
    func ay_setHighlightedImage(_ imageName: String) -> UIButton {
        self.setImage(UIImage(named: imageName), for: .highlighted)
        return self
    }
    
    func ay_setTitleFont(_ font: UIFont) -> UIButton {
        self.titleLabel?.font = font
        return self
    }
    
    func ay_setTintColor(_ tintColor: UIColor) -> UIButton {
        self.tintColor = tintColor
        return self
    }
    
    func ay_setNormalTitleColor(_ titleColor: UIColor) -> UIButton {
        self.setTitleColor(titleColor, for: .normal)
        return self
    }
    
    func ay_setHighlightedTitleColor(_ titleColor: UIColor) -> UIButton {
        self.setTitleColor(titleColor, for: .highlighted)
        return self
    }
    
    func ay_setSelectedTitleColor(_ titleColor: UIColor) -> UIButton {
        self.setTitleColor(titleColor, for: .selected)
        return self
    }
    
    func ay_setBackGroudColor(_ bgColor: UIColor) -> UIButton {
        self.backgroundColor = bgColor
        return self
    }
    
    func ay_setBackGroundNormalImage(_ imageName: String) -> UIButton {
        self.setBackgroundImage(UIImage(named: imageName), for: .normal)
        return self
    }
    
    func ay_setBackGroundHighlightedImage(_ imageName: String) -> UIButton {
        self.setBackgroundImage(UIImage(named: imageName), for: .highlighted)
        return self
    }
    
    func ay_setBackGroundSelectedImage(_ imageName: String) -> UIButton {
        self.setBackgroundImage(UIImage(named: imageName), for: .selected)
        return self
    }
    
    func ay_setTouchUpInsideAction(_ target: Any?, action: Selector) -> UIButton {
        self.addTarget(target, action: action, for: .touchUpInside)
        return self
    }
}



extension UIView {
    
    
    func ay_minX() -> CGFloat {
        return self.frame.minX
    }
    
    func ay_minY() -> CGFloat {
        return self.frame.minY
    }
    
    func ay_maxX() -> CGFloat {
        return self.frame.maxX
    }
    
    func ay_maxY() -> CGFloat {
        return self.frame.maxY
    }
    
    func ay_width() -> CGFloat {
        return self.frame.width
    }
    
    func ay_Height() -> CGFloat {
        return self.frame.height
    }
    
    func ay_midX() -> CGFloat {
        return self.frame.midX
    }
    
    func ay_midY() -> CGFloat {
        return self.frame.midY
    }
    
    func ay_setMidX(_ midX: CGFloat) -> UIView {
        self.center = CGPoint(x: midX, y: self.ay_midY())
        return self
    }
    
    func ay_setMidY(_ midY: CGFloat) -> UIView {
        self.center = CGPoint(x: self.ay_midX(), y: midY)
        return self
    }
    
    func ay_setY(_ Y: CGFloat) -> UIView {
        var rect = self.frame
        rect.origin.y = Y
        self.frame = rect
        return self
    }
    
    func ay_setX(_ X: CGFloat) -> UIView {
        var rect = self.frame
        rect.origin.x = X
        self.frame = rect
        return self
    }
    
    func ay_setMaxY(_ maxY: CGFloat) -> UIView {
        var rect = self.frame
        rect.origin.y = maxY - rect.size.height
        self.frame = rect
        return self
    }
    
    func ay_setMaxX(_ maxX: CGFloat) -> UIView {
        var rect = self.frame
        rect.origin.x = maxX - rect.size.width
        self.frame = rect
        return self
    }
    
    func ay_setWidth(_ width: CGFloat) -> UIView {
        var rect = self.frame
        rect.size.width = width
        self.frame = rect
        return self
    }
    
    func ay_setHeight(_ height: CGFloat) -> UIView {
        var rect = self.frame
        rect.size.height = height
        self.frame = rect
        return self
    }
    
    func ay_setCenter(_ center: CGPoint) -> UIView {
        self.center = center
        return self
    }
    
    

    
    
    
}

extension UITableView {
    func ay_dequeueOrInitCell(nibName: String, identifier:String) -> UITableViewCell {
        // 需要在 xib 设置 Identifier
        var cell = self.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first! as? UITableViewCell
            cell?.selectionStyle = .none
        }
        return cell!
    }
}

// MARK: String
extension String {
    
    /// 获取文字的 size
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字 size
    func ay_getSize(maxSize: CGSize = CGSize(width: kScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGSize {
        return self.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).size;
    }
    
    /// 获取文字宽 (单行)
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字宽度
    func ay_getWidth(maxWidth: CGFloat = kScreenWidth, font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGFloat {
        return self.boundingRect(with: CGSize(width: maxWidth, height: 100), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).width + 1;
    }
    
    /// 获取文字高 (单行)
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字宽度
    func ay_getHeight(maxWidth: CGFloat = kScreenWidth, font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGFloat {
        return self.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).height + 1;
    }
    
}

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











