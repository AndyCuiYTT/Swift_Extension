//
//  AY_String+Extend.swift
//
//  Created by Andy on 2017/6/19.
//  Copyright © 2017年 AndyCuiYTT. All rights reserved.
//

import UIKit

var kEncryptKeyStr: String = "dddddddd" //网络请求参数加密字符串


// MARK: - String 扩展
extension String{
    
    /// 字符串 MD5 加密
    ///
    /// - Returns: 加密后的 MD5 字符串
    func ay_MD5() -> String {
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
    func ay_xorEncryptString() -> Data {
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
    func ay_JSONToAny() -> Any {
        
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
    func ay_base64Encode() -> String {
        let data = self.data(using: .utf8)
        return (data?.base64EncodedString(options: .endLineWithLineFeed))!
    }
    
    /// base64 解码
    ///
    /// - Returns: 解码后的字符串
    func ay_base64Decode() -> String {
        let data: Data = self.data(using: .utf8)!
        return String.init(data: data, encoding: .utf8)!
    }
    
    
        
    
    
}

// MARK: 正则判断
extension String {
    /// 判断是否为手机号
    ///
    /// - Returns: 要判断的字符串
    func ay_isPhoneNumber() -> Bool {
        let predicare = NSPredicate(format: "SELF MATCHES %@", "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)")
        return predicare.evaluate(with: self)
    }
    
    
    ///  判断是否为数字
    ///
    /// - Returns: 要判断的字符串
    func ay_isNumber() -> Bool {
        let predicare = NSPredicate(format: "^[0-9]*$")
        return predicare.evaluate(with: self)
    }
    
    ///  判断是否为两位小数
    ///
    /// - Returns: 要判断的字符串
    func ay_isDecimal() -> Bool {
        let predicare = NSPredicate(format: "^(([1-9][0-9]*)|(([0].d{1,2}|[1-9][0-9]*.d{1,2})))$")
        return predicare.evaluate(with: self)
    }


}


// MARK: -  Dictionary 扩展
extension Dictionary {
    
    /// 将字典转为 JSON 字符串
    ///
    /// - Returns: JSON 字符串
    func ay_toJSONString() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String.init(data: jsonData, encoding: .utf8)!
    }
    
    /// base64 编码
    ///
    /// - Returns: 编码后字典
    func ay_base64Encode() -> Dictionary {
        
        if let dic = self as?  Dictionary<String , Any>{
            var result = Dictionary<String , Any>()
            for (key , value) in dic {
                if let item = value as? String {
                    result[key] = item.ay_base64Encode()
                }else if let item = value as? Dictionary<String , Any> {
                    result[key] = item.ay_base64Encode()
                }else if let item = value as? Array<Any> {
                    result[key] = item.ay_base64Encode()
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
    func ay_base64Decode() -> Dictionary{
        if let dic = self as?  Dictionary<String , Any>{
            var result = Dictionary<String , Any>()
            for (key , value) in dic {
                if let item = value as? String {
                    result[key] = item.ay_base64Decode()
                }else if let item = value as? Dictionary<String , Any> {
                    result[key] = item.ay_base64Decode()
                }else if let item = value as? Array<Any> {
                    result[key] = item.ay_base64Decode()
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


// MARK: - Array 扩展
extension Array {
    
    /// 将数组转为 JSON 字符串
    ///
    /// - Returns: JSON 字符串
    func ay_toJSONString() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        return String.init(data: jsonData, encoding: .utf8)!
    }
    
    /// base64 转码
    ///
    /// - Returns: 转码后数组
    func ay_base64Encode() -> Array<Any> {
        var result = Array<Any>()
        for item in self {
            if let value = item as? String {
                result.append(value.ay_base64Encode())
            }else if let value = item as? Array {
                result.append(value.ay_base64Encode())
            }else if let value = item as? Dictionary<String, Any> {
                result.append(value.ay_base64Encode())
            }else {
                result.append(item)
            }
        }
        return result
    }
    
    /// base64 解码
    ///
    /// - Returns: 解码后数组
    func ay_base64Decode() -> Array<Any> {
        var result = Array<Any>()
        for item in self {
            if let value = item as? String {
                result.append(value.ay_base64Decode())
            }else if let value = item as? Array {
                result.append(value.ay_base64Decode())
            }else if let value = item as? Dictionary<String, Any> {
                result.append(value.ay_base64Decode())
            }else {
                result.append(item)
            }
        }
        return result
    }

}

extension Data {
    
    /// JSON 解析
    ///
    /// - Returns: JSON 解析后的对象
    func ay_JSONToAny() -> Any {
        do {
            let result = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
            return result
        } catch  {
            return self
        }
    }

}




