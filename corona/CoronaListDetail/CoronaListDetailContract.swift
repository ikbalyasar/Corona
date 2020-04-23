//
//  CoronaListDetailContract.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation

protocol CoronaListDetailViewModelProtocol {
    
    var  delegate : CoronaListDetailViewModelDelegate? {get set}
}

enum CoronaListDetailViewModelOutput {

}

enum CoronaListDetailRoute {

}


protocol CoronaListDetailViewModelDelegate : class {
    func handleViewModelOutput(_ output: CoronaListDetailViewModelOutput)
    func navigate(to route : CoronaListDetailRoute)
}

