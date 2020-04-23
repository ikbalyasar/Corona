//
//  CoronaViewModel.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation


final class CoronaViewModel : CoronaViewModelProtocol {
    
    var delegate: CoronaViewModelDelegate?
    
    private let listServiceService: ListServiceProtocol
    
    init(listServiceService: ListService) {
        self.listServiceService = listServiceService
        
    }
    
    func load() {
        notify(.setLoading(true))
        listServiceService.fetchMap (){ [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let response):
                self.notify(.showCoronaList([response]))
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func selectCity(indexpath:Int) {
        self.delegate?.navigate(to: .detail)
    }
    
    private func notify(_ output: CoronaViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

