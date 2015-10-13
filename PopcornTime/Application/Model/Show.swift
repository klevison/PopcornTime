//
//  Show.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/1/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import UIKit
import ObjectMapper

enum Genre: String {
    
    case Action = "Action"
    case Adventure = "Adventure"
    case Drama = "Drama"
    case Crime = "Crime"
    case Mystery = "Mystery"
    case Comedy = "Comedy"
    case Thriller = "Thriller"
    
    func initWithGenreString(genre: String) -> Genre? {
        switch genre {
            case "Action": return .Action
            case "Adventure": return .Adventure
            case "Drama": return .Drama
            case "Crime": return .Crime
            case "Mystery": return .Mystery
            case "Comedy": return .Comedy
            case "Thriller": return .Thriller
            default: return nil
        }
    }
    
}


enum DaysOfTheWeek: String {

    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
    case Sunday = "Sunday"
    
    func initWithDay(day: String) -> DaysOfTheWeek? {
        switch day {
            case "Monday": return .Monday
            case "Tuesday": return .Tuesday
            case "Wednesday": return .Wednesday
            case "Thursday": return .Thursday
            case "Friday": return .Friday
            case "Saturday": return .Saturday
            case "Sunday": return .Sunday
            default: return nil
        }
    }
    
}

private struct ShowAPIField {
    
    static let idKey = "_id"
    static let airDayKey = "air_day"
    static let airTimeKey = "air_time"
    static let countryKey = "country"
    static let imagesKey = "images"
    static let imdbIdKey = "imdb_id"
    static let lastUpdatedKey = "last_updated"
    static let networkKey = "network"
    static let numSeasonsKey = "num_seasons"
    static let ratingKey = "rating"
    static let runtimeKey = "runtime"
    static let slugKey = "slug"
    static let statusKey = "status"
    static let synopsisKey = "synopsis"
    static let titleKey = "title"
    static let tvdbIdKey = "tvdb_id"
    static let yearKey = "year"
    static let genresKey = "genres"
    static let episodesKey = "episodes"
    
}

final class Show: Mappable {
    
    var id: String?
    var airDay: DaysOfTheWeek?
    var airTime: String?
    var country: String?
    var images: ShowImage?
    var imdbId: String?
    var lastUpdated: Int?
    var network: String?
    var numSeasons: Int?
    var rating: Rating?
    var runtime: String?
    var slug: String?
    var status: String?
    var synopsis: String?
    var title: String?
    var tvdbId: String?
    var year: Int?
    var genres: [Genre]?
    var episodes: [Episode]?
    
    init() {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map[ShowAPIField.idKey]
        airDay <- (map[ShowAPIField.airDayKey], EnumTransform<DaysOfTheWeek>())
        airTime <- map[ShowAPIField.airTimeKey]
        country <- map[ShowAPIField.countryKey]
        images <- map[ShowAPIField.imagesKey]
        imdbId <- map[ShowAPIField.imdbIdKey]
        lastUpdated <- map[ShowAPIField.lastUpdatedKey]
        network <- map[ShowAPIField.networkKey]
        numSeasons <- map[ShowAPIField.numSeasonsKey]
        rating <- map[ShowAPIField.ratingKey]
        runtime <- map[ShowAPIField.runtimeKey]
        slug <- map[ShowAPIField.slugKey]
        status <- map[ShowAPIField.statusKey]
        synopsis <- map[ShowAPIField.synopsisKey]
        title <- map[ShowAPIField.titleKey]
        tvdbId <- map[ShowAPIField.tvdbIdKey]
        year <- (map[ShowAPIField.yearKey], StringToIntTransform())
        genres <- (map[ShowAPIField.genresKey], EnumTransform<Genre>())
        episodes <- map[ShowAPIField.episodesKey]
    }

}
