//
//  ShowImage.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/7/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct ShowImageAPIField {
    
    static let posterUrlStringKey = "poster"
    static let fanartUrlStringKey = "fanart"
    static let bannerUrlStringKey = "banner"
    
}


final class ShowImage: Mappable {
    
    var posterUrlString: String?
    var fanartUrlString: String?
    var bannerUrlString: String?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        posterUrlString <- map[ShowImageAPIField.posterUrlStringKey]
        fanartUrlString <- map[ShowImageAPIField.fanartUrlStringKey]
        bannerUrlString <- map[ShowImageAPIField.bannerUrlStringKey]
    }
    
}