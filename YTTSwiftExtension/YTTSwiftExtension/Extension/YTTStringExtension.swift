//
//  YTTStringExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit


/// 亦或加密秘钥
let kEncryptKeyStr: String = "dddddd"
fileprivate let screenWidth = UIScreen.main.bounds.width
fileprivate let screenHeight = UIScreen.main.bounds.height


extension String {
    
    /// 字符串 MD5 加密
    ///
    /// - Returns: 加密后的 MD5 字符串
    func ytt_MD5() -> String {
        let str = self.cString(using: .utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: .utf8))
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(str, strLen, result)
        let MD5Str = NSMutableString()
        for i in 0 ..< Int(CC_MD5_DIGEST_LENGTH) {
            MD5Str.appendFormat("%02x", result[i])
        }
        result.deinitialize()
        return MD5Str as String
    }
    
    /// 异或算法
    ///
    /// - Returns: 加密后数据
    func ytt_xorEncryptString() -> Data {
        var dataData: Data = self.data(using: .utf8)!
        var keyData: Data = kEncryptKeyStr.data(using: .utf8)!
        var resultData: Data = Data()
        for i in 0 ..< dataData.count {
            let result = dataData[i] ^ keyData[i % keyData.count]
            resultData.append(result)
        }
        return resultData
    }
    
    /// JSON 解析
    ///
    /// - Returns: JSON 解析后的对象
    func ytt_JSONToAny() -> Any {
        
        do {
            let result = try JSONSerialization.jsonObject(with: self.data(using: .utf8)!, options: .mutableContainers)
            return result
        } catch  {
            return self
        }
    }
    
    /// base64 转码
    ///
    /// - Returns: 转码后的字符串
    func ytt_base64Encode() -> String {
        let data = self.data(using: .utf8)
        return (data?.base64EncodedString(options: .endLineWithLineFeed))!
    }
    
    /// base64 解码
    ///
    /// - Returns: 解码后的字符串
    func ytt_base64Decode() -> String {
        //let data: Data = self.data(using: .utf8)!
        let data: Data = Data(base64Encoded: self, options: .init(rawValue: 0))!
        return String.init(data: data, encoding: .utf8)!
    }
}

// MARK: 正则判断
extension String {
    /// 判断是否为手机号
    ///
    /// - Returns: 要判断的字符串
    func ytt_isPhoneNumber() -> Bool {
        let predicare = NSPredicate(format: "SELF MATCHES %@", "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)")
        return predicare.evaluate(with: self)
    }
    
    
    ///  判断是否为数字
    ///
    /// - Returns: 要判断的字符串
    func ytt_isNumber() -> Bool {
        let predicare = NSPredicate(format: "^[0-9]*$")
        return predicare.evaluate(with: self)
    }
    
    ///  判断是否为两位小数
    ///
    /// - Returns: 要判断的字符串
    func ytt_isDecimal() -> Bool {
        let predicare = NSPredicate(format: "^(([1-9][0-9]*)|(([0].d{1,2}|[1-9][0-9]*.d{1,2})))$")
        return predicare.evaluate(with: self)
    }
}

// MARK: 计算文字 size
extension String {
    
    /// 获取文字的 size
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字 size
    func ytt_getSize(maxSize: CGSize = CGSize(width: screenWidth, height: CGFloat(MAXFLOAT)), font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGSize {
        return self.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).size;
    }
    
    /// 获取文字宽 (单行)
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字宽度
    func ytt_getWidth(maxWidth: CGFloat = screenWidth, font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGFloat {
        return self.boundingRect(with: CGSize(width: maxWidth, height: 100), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).width + 1;
    }
    
    /// 获取文字高 (单行)
    ///
    /// - Parameters:
    ///   - maxSize: 限定 size
    ///   - font: 字体大小
    /// - Returns: 文字宽度
    func ytt_getHeight(maxWidth: CGFloat = screenWidth, font: UIFont = UIFont.systemFont(ofSize: 12)) -> CGFloat {
        return self.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName : font], context: nil).height + 1;
    }
    
}


