//
//  User.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation

public struct Map: Decodable {
    public let id: Int
    public let name: String
    public let confirmedCount: Int
    public let deathCount: Int
    public let recovryCount: Int
    public let lat: String
    public let long: String
  
    enum CodingKeys: String, CodingKey {
        case id
        case confirmedCount
        case deathCount
        case recovryCount
        case name
        case lat
        case long
    }
}


//{"id":0,"confirmedCount":14,"deathCount":1,"recovryCount":0,"name":"Suriye","lat":"34.8021","long":"38.9968"}
