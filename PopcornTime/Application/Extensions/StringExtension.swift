//
//  StringExtension.swift
//  
//
//  Created by Klevison Matias on 10/1/15.
//
//

import Foundation

extension String {
    
    static func JSONStringify(value: AnyObject,prettyPrinted:Bool = false) -> String {
        let options = prettyPrinted ? NSJSONWritingOptions.PrettyPrinted : NSJSONWritingOptions(rawValue: 0)
        if NSJSONSerialization.isValidJSONObject(value) {
            do{
                let data = try NSJSONSerialization.dataWithJSONObject(value, options: options)
                if let string = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    return string as String
                }
            }catch {
                print("error")
                //Access error here
            }
        }
        return ""
    }
    
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
    }
    
    func toDouble() -> Double? {
        if let num = NSNumberFormatter().numberFromString(self){
            return num.doubleValue
        }else{
            return nil
        }
    }
    
    func toFloat() -> Float?{
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    func contains(s: String) -> Bool {
        return (self.rangeOfString(s) != nil) ? true : false
    }
    
    func hexToBinary(bits: Int) -> String {
        if self.characters.count == 0 {
            return ""
        }
        
        let scanner = NSScanner(string: self)
        var result : UInt32 = 0
        if scanner.scanHexInt(&result) {
            return self.toBinary(result).makeBitsBinary(bits)
        }
        
        return ""
    }
    
    func makeBitsBinary(bits: Int) -> String {
        if self.characters.count < bits {
            var result = ""
            let total = bits - self.characters.count
            for _ in 0..<total {
                result = "\(result)\(0)"
            }
            
            return result+self
        }
        return self
    }
    
    static func isEmpty(string: String?) -> Bool {
        if string == nil { return true }
        
        return string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty
    }
    
    private func toBinary(input: UInt32) -> String {
        if input == 1 || input == 0 {
            return "\(input)"
        }
        return "\(toBinary(input/2))\(input % 2)"
    }
    
    
    //Used by RSBarcodes
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    func substring(location:Int, length:Int) -> String! {
        return (self as NSString).substringWithRange(NSMakeRange(location, length))
    }
    
    func location(other: String) -> Int {
        return (self as NSString).rangeOfString(other).location
    }
    
    // http://stackoverflow.com/questions/6644004/how-to-check-if-nsstring-is-contains-a-numeric-value
    func isNumeric() -> Bool {
        return (self as NSString).rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).location == NSNotFound
    }
    
}
