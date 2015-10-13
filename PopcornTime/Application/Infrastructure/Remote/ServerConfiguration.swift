//
//  ServerConfiguration.swift
//  Viper
//
//  Created by Thiago Ramos on 6/16/15.
//  Copyright (c) 2015 Directed. All rights reserved.
//

import Foundation

class ServerConfiguration {
    
    var baseUrl: String = ""
    var apiUrl: String = ""
    
    static let stant: ServerConfiguration = {
        return ServerConfiguration.build()
    }()
    
    private static func build() -> ServerConfiguration {

        let serverConfiguration = ServerConfiguration()
//        serverConfiguration.apiUrl = "http://development.stant.com.br/api/v1"
        serverConfiguration.apiUrl = "http://10.0.1.105:3000/api/v1"
        
        return serverConfiguration
    }
    
}

//class ServerConfiguration: Mappable {
//    
//    var baseUrl: String = ""
//    var apiUrl: String = ""
//    var apiVersion: String = ""
//    
//    static let stant: ServerConfiguration = {
//        return ServerConfiguration.build("ServerConfiguration")
//    }()
//    
//    
//    init(){}
//    
//    required init?(_ map: Map) {
//        mapping(map)
//    }
//    
//    func mapping(map: Map) {
//        baseUrl <- map["baseUrl"]
//        apiUrl <- map["apiUrl"]
//        apiVersion <- map["apiVersion"]
//    }
//    
//    private static func build(serverConfiguration: String) -> ServerConfiguration {
//        if let path = NSBundle.mainBundle().pathForResource(serverConfiguration, ofType: "plist") {
//            if let rootDictionary = NSDictionary(contentsOfFile: path) {
//                #if DEBUG
//                    return Mapper<ServerConfiguration>().map(rootDictionary.objectForKey("development"))!
//                    #else
//                    return Mapper<ServerConfiguration>().map(rootDictionary.objectForKey("production"))!
//                #endif
//            }
//        }
//        return ServerConfiguration()
//    }
//}