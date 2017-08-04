//
//  YTTArrayExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

// MARK: - Array 扩展
extension Array {
    
    /// 将数组转为 JSON 字符串
    ///
    /// - Returns: JSON 字符串
    func ytt_toJSONString() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String.init(data: jsonData, encoding: .utf8)!
    }
    
    /// base64 转码
    ///
    /// - Returns: 转码后数组
    func ytt_base64Encode() -> Array<Any> {
        var result = Array<Any>()
        for item in self {
            if let value = item as? String {
                result.append(value.ytt_base64Encode())
            }else if let value = item as? Array {
                result.append(value.ytt_base64Encode())
            }else if let value = item as? Dictionary<String, Any> {
                result.append(value.ytt_base64Encode())
            }else {
                result.append(item)
            }
        }
        return result
    }
    
    /// base64 解码
    ///
    /// - Returns: 解码后数组
    func ytt_base64Decode() -> Array<Any> {
        var result = Array<Any>()
        for item in self {
            if let value = item as? String {
                result.append(value.ytt_base64Decode())
            }else if let value = item as? Array {
                result.append(value.ytt_base64Decode())
            }else if let value = item as? Dictionary<String, Any> {
                result.append(value.ytt_base64Decode())
            }else {
                result.append(item)
            }
        }
        return result
    }
    
}

