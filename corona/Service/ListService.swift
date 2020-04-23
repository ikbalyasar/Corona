//
//  ListService.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import Alamofire

public protocol ListServiceProtocol{
    func fetchMap(complation: @escaping (Result<List>) ->Void)
}

public struct ListService:ListServiceProtocol{
    
    public init (){}
    
    public func fetchMap(complation: @escaping (Result<List>) -> Void) {
        AF.request(Urls.list.rawValue, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do{
                        let list = try JSONDecoder().decode(List.self, from: data)
                        complation(.success(list))
                    }catch{
                        complation(.failure(Error.serializationError(internal: error)))
                    }
                case .failure(let error):
                    complation(.failure(Error.networkError(internal: error)))
                }
        }
    }
}


