//
//  Map.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import Alamofire

public protocol MapServiceProtocol{
    func fetchMap(complation: @escaping (Result<[Map]>) ->Void)
}

public struct MapService:MapServiceProtocol{
    
    public init (){}
    
    public func fetchMap(complation: @escaping (Result<[Map]>) -> Void) {
        AF.request(Urls.map.rawValue, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do{
                         let decoder = JSONDecoder()
                        let map = try decoder.decode([Map].self, from: data)
                        complation(.success(map))
                    }catch{
                        complation(.failure(Error.serializationError(internal: error)))
                    }
                case .failure(let error):
                    complation(.failure(Error.networkError(internal: error)))
                }
        }
    }
}
