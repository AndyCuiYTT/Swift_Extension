//
//  YTTDictionaryExtension.swift
//  YTTSwiftExtension
//
//  Created by Andy on 2017/8/4.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

extension Dictionary {
 
        /// 将字典转为 JSON 字符串
        ///
        /// - Returns: JSON 字符串
        func ytt_toJSONString() -> String {
            let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String.init(data: jsonData, encoding: .utf8)!
        }
        
        /// base64 编码
        ///
        /// - Returns: 编码后字典
        func ytt_base64Encode() -> Dictionary {
            
            if let dic = self as?  Dictionary<String , Any>{
                var result = Dictionary<String , Any>()
                for (key , value) in dic {
                    if let item = value as? String {
                        result[key] = item.ytt_base64Encode()
                    }else if let item = value as? Dictionary<String , Any> {
                        result[key] = item.ytt_base64Encode()
                    }else if let item = value as? Array<Any> {
                        result[key] = item.ytt_base64Encode()
                    }else {
                        result[key] = value
                    }
                }
                return result as! Dictionary<Key, Value>
            }else {
                return self
            }
        }
        
        /// base64 解码
        ///
        /// - Returns: 解码后字典
        func ytt_base64Decode() -> Dictionary{
            if let dic = self as?  Dictionary<String , Any>{
                var result = Dictionary<String , Any>()
                for (key , value) in dic {
                    if let item = value as? String {
                        result[key] = item.ytt_base64Decode()
                    }else if let item = value as? Dictionary<String , Any> {
                        result[key] = item.ytt_base64Decode()
                    }else if let item = value as? Array<Any> {
                        result[key] = item.ytt_base64Decode()
                    }else {
                        result[key] = value
                    }
                }
                return result as! Dictionary<Key, Value>
            }else {
                return self
            }
        }
    }

