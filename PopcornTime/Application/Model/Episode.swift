//
//  Episode.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/7/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct EpisodeAPIField {
    
    static let firstAiredKey = "first_aired"
    static let overviewKey = "overview"
    static let titleKey = "title"
    static let episodeKey = "episode"
    static let seasonKey = "season"
    static let tvdbIdKey = "tvdb_id"
    static let torrentsKey = "torrents"
    
}

final class Episode: Mappable {
    
    var firstAired: Int?
    var overview: String?
    var title: String?
    var episode: Int?
    var season: Int?
    var tvdbId: Int?
    var torrents: TorrentFile?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        firstAired <- map[EpisodeAPIField.firstAiredKey]
        overview <- map[EpisodeAPIField.overviewKey]
        title <- map[EpisodeAPIField.titleKey]
        episode <- map[EpisodeAPIField.episodeKey]
        season <- map[EpisodeAPIField.seasonKey]
        tvdbId <- map[EpisodeAPIField.tvdbIdKey]
        torrents <- map[EpisodeAPIField.torrentsKey]
    }
    
}