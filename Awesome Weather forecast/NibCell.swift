//
//  NibCell.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

protocol NibCell {
    static var nib: UINib { get }
    static var reuseId: String { get }
}
