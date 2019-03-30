//
//  CustomCollectionViewLayout.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import UIKit

protocol CustomCollectionViewLayout: class {
    var cache: [UICollectionViewLayoutAttributes] { get set }
}

extension CustomCollectionViewLayout where Self: UICollectionViewLayout {
    
    // Perform a binary search on the cached attributes array.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        guard mid < cache.count else { return nil }
        let attr = cache[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }
    
}

