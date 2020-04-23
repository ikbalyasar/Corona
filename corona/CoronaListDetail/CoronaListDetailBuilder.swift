//
//  CoronaListDetailBuilder.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import UIKit

final class CoronaListDetailBuilder
{
    static func make() -> CoronaListDetailViewController {
        let storyboard = UIStoryboard.init(name: "CoronaListDetail" , bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoronaListDetailViewController" ) as! CoronaListDetailViewController
        viewController.viewModel =  CoronaListDetailViewModel()
        return viewController
    }
}

