//
//  Result.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation

public enum Result<Value>{
    case success(Value)
    case failure(Error)
}
