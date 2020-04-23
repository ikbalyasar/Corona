//
//  CoronaContract.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation

protocol CoronaViewModelProtocol {
    
    var  delegate : CoronaViewModelDelegate? {get set}
    func load()
    func selectCity(indexpath:Int)
}

enum CoronaViewModelOutput {
    case setLoading(Bool)
    case showCoronaList([List])
}

enum CoronaRoute {
   case detail
}


protocol CoronaViewModelDelegate : class {
    func handleViewModelOutput(_ output: CoronaViewModelOutput)
    func navigate(to route : CoronaRoute)
}

