//
//  ViewControllerAssebly.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

protocol ViewControllerAssebly {
    associatedtype ViewControllerType: UIViewController
    
    func assembly() -> ViewControllerType
}
