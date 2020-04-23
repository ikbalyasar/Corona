//
//  AppContainer.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation


let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let mapsService = MapService()
    let listService = ListService()
   
}
