//
//  MapViewModel.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation


final class MapViewModel : MapViewModelProtocol {
   
    
    var delegate: MapViewModelDelegate?
    
    private let mapServiceService: MapServiceProtocol
    
    init(mapServiceService: MapService) {
        self.mapServiceService = mapServiceService
        
    }
    
    func load() {
        notify(.setLoading(true))
        mapServiceService.fetchMap (){ [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let response):
                self.notify(.showCorona(response))
            case .failure(let error):
                print(error)
            }
            
        }
    }
    private func notify(_ output: MapViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

