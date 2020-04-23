//
//  CoronaBuilder.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import UIKit

final class CoronaBuilder
{
    static func make() -> CoronaViewController {
        let storyboard = UIStoryboard.init(name: "Corona" , bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoronaViewController" ) as! CoronaViewController
        viewController.viewModel =  CoronaViewModel(listServiceService: app.listService)
        return viewController
    }
}

