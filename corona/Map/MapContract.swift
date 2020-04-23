//
//  MapContract.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation

protocol MapViewModelProtocol {
    
    var  delegate : MapViewModelDelegate? {get set}
    func load()
}

enum MapViewModelOutput {
    case setLoading(Bool)
    case showCorona([Map])
}

enum MapRoute {

}


protocol MapViewModelDelegate : class {
    func handleViewModelOutput(_ output: MapViewModelOutput)
    func navigate(to route : MapRoute)
}


