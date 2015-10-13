//
//  Rating.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/7/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct RatingAPIField {
    
    static let hatedKey = "hated"
    static let lovedKey = "loved"
    static let votesKey = "votes"
    static let percentageKey = "percentage"
    static let watchingKey = "watching"
    
}

final class Rating: Mappable {
    
    var hated: Int?
    var loved: Int?
    var votes: Int?
    var percentage: Int?
    var watching: Int?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        hated <- (map[RatingAPIField.hatedKey], StringToIntTransform())
        loved <- (map[RatingAPIField.lovedKey], StringToIntTransform())
        votes <- map[RatingAPIField.votesKey]
        percentage <- map[RatingAPIField.percentageKey]
        watching <- map[RatingAPIField.watchingKey]
    }
    
}