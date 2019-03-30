//
//  CollectionViewExtensions.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

extension UICollectionView {
    
    func registerNibCell(_ cell: NibCell.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.reuseId)
    }
    
}

extension UICollectionView {
    
    func dequeueReusableNibCell<T:NibCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as! T
    }
    
}
