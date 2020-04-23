//
//  List.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation


public struct List: Codable {
    public let data: [City] 
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

public struct City: Codable {
    public let countryStats: CountryStats
    public let cityStats: [CountryStats]
    
    enum CodingKeys: String, CodingKey {
        case countryStats
        case cityStats
    }
}

public struct CountryStats: Codable {
    public let order: Int
    public let confirmedCount: Int
    public let deathCount: Int
    public let recovryCount: Int
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case order
        case confirmedCount
        case deathCount
        case recovryCount
        case name
    }
}


