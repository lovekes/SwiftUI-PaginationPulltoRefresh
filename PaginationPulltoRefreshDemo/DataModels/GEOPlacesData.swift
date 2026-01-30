//
//  GEOPlacesData.swift
//  PaginationPulltoRefreshDemo
//
//  Created by Lokesh Kumawat on 22/01/26.
//

import Foundation

struct GEOPlaces: Codable {
    let data : [GEOPlacesData]?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([GEOPlacesData].self, forKey: .data)
    }

}
struct GEOPlacesData : Codable {
    let uuID = UUID()
    let id : Int?
    let wikiDataId : String?
    let type : String?
    let name : String?
    let country : String?
    let countryCode : String?
    let region : String?
    let regionCode : String?
    let regionWdId : String?
    let latitude : Double?
    let longitude : Double?
    let population : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case wikiDataId = "wikiDataId"
        case type = "type"
        case name = "name"
        case country = "country"
        case countryCode = "countryCode"
        case region = "region"
        case regionCode = "regionCode"
        case regionWdId = "regionWdId"
        case latitude = "latitude"
        case longitude = "longitude"
        case population = "population"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        wikiDataId = try values.decodeIfPresent(String.self, forKey: .wikiDataId)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        regionCode = try values.decodeIfPresent(String.self, forKey: .regionCode)
        regionWdId = try values.decodeIfPresent(String.self, forKey: .regionWdId)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        population = try values.decodeIfPresent(Int.self, forKey: .population)
    }
}
