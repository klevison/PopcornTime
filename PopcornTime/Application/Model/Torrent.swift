//
//  Torrent.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/7/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation
import ObjectMapper

private struct TorrentAPIField {
    
    static let quality0Key = "0"
    static let quality480pKey = "480p"
    static let quality720pKey = "720p"
    static let quality1080pKey = "1080p"
    static let peersKey = "peers"
    static let seedsKey = "seeds"
    static let urlKey = "url"
    
}

final class Torrent: Mappable {
    
    var peers: Int?
    var seeds: Int?
    var url: String?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        peers <- map[TorrentAPIField.peersKey]
        seeds <- map[TorrentAPIField.seedsKey]
        url <- map[TorrentAPIField.urlKey]
    }
    
}

final class TorrentFile: Mappable {
    
    var quality0: Torrent?
    var quality480p: Torrent?
    var quality720p: Torrent?
    var quality1080p: Torrent?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        quality0 <- map[TorrentAPIField.quality0Key]
        quality480p <- map[TorrentAPIField.quality480pKey]
        quality720p <- map[TorrentAPIField.quality720pKey]
        quality1080p <- map[TorrentAPIField.quality1080pKey]
    }
    
}
