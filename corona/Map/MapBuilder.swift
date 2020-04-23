//
//  MapBuilder.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import UIKit

final class MapBuilder
{
    static func make() -> MapViewController {
        let storyboard = UIStoryboard.init(name: "Map" , bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MapViewController" ) as! MapViewController
        viewController.viewModel =  MapViewModel(mapServiceService: app.mapsService)
        return viewController
    }
}

