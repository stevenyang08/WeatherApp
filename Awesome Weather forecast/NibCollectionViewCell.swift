//
//  NibCollectionViewCell.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class NibCollectionViewCell: UICollectionViewCell{
    
}

extension NibCollectionViewCell: NibCell{
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var reuseId: String {
        return String(describing: self)
    }
}
