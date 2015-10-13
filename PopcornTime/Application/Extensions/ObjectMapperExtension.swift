import Foundation

//
//  TransformOf.swift
//  ObjectMapper
//
//  Created by Syo Ikeda on 1/23/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import ObjectMapper

public class TransformOf<ObjectType, JSONType>: TransformType {
    public typealias Object = ObjectType
    public typealias JSON = JSONType
    
    private let fromJSON: JSONType? -> ObjectType?
    private let toJSON: ObjectType? -> JSONType?
    
    public init(fromJSON: JSONType? -> ObjectType?, toJSON: ObjectType? -> JSONType?) {
        self.fromJSON = fromJSON
        self.toJSON = toJSON
    }
    
    public func transformFromJSON(value: AnyObject?) -> ObjectType? {
        return fromJSON(value as? JSONType)
    }
    
    public func transformToJSON(value: ObjectType?) -> JSONType? {
        return toJSON(value)
    }
}

func StringToIntTransform() -> TransformOf<Int, String> {
    return TransformOf<Int, String>(fromJSON: { (value: String?) -> Int? in
        // transform value from String? to Int?
        return Int(value!)
        }, toJSON: { (value: Int?) -> String? in
            // transform value from Int? to String?
            if let value = value {
                return String(value)
            }
            return nil
    })
}

func StringToFloatTransform() -> TransformOf<Float, String> {
    return TransformOf<Float, String>(fromJSON: { (value: String?) -> Float? in
        // transform value from String? to Float?
        return value?.toFloat()
        }, toJSON: { (value: Float?) -> String? in
            // transform value from Float? to String?
            if let value = value {
                return String(stringInterpolationSegment: value)
            }
            return nil
    })
}

func StringToDoubleTransform() -> TransformOf<Double, String> {
    return TransformOf<Double, String>(fromJSON: { (value: String?) -> Double? in
        // transform value from String? to Double?
        return value?.toDouble()
        }, toJSON: { (value: Double?) -> String? in
            // transform value from Double? to String?
            if let value = value {
                return String(stringInterpolationSegment: value)
            }
            return nil
    })
}

func StringToBoolTransform() -> TransformOf<Bool, String> {
    return TransformOf<Bool, String>(fromJSON: { (value: String?) -> Bool? in
        // transform value from String? to Bool?
        return value?.toBool()
        }, toJSON: { (value: Bool?) -> String? in
            // transform value from Bool? to String?
            if let value = value {
                return value ? "1":"0"
            }
            return nil
    })
}

extension String {
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
}