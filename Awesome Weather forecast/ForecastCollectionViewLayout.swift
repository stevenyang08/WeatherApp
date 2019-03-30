//
//  ForecastCollectionViewLayout.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import UIKit

class ForecastCollectionViewLayout: UICollectionViewFlowLayout, CustomCollectionViewLayout {
    var cache = [UICollectionViewLayoutAttributes]()
    
    var cellHeight: CGFloat = 100.0
    private var cellWidth: CGFloat = 180.0
    var cellPadding: CGFloat = 5.0
    var xOffset: CGFloat = 15.0
    var colums = 1
    
    override init() {
        super.init()
        
        self.cellHeight = 100.0
        self.cellWidth = 180.0
        self.cellPadding = 5.0
        self.xOffset = 15.0
        self.colums = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.cellHeight = 100.0
        self.cellWidth = 180.0
        self.cellPadding = 5.0
        self.xOffset = 15.0
        self.colums = 1
    }
    
    private var contentHeight: CGFloat = 0.0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.bounds.width ?? 0.0,
                      height: contentHeight)
    }
    
    override func invalidateLayout() {
        cache.removeAll()
    }
    
    override func prepare() {
        guard let collectionView = collectionView,
            cache.isEmpty
            else {
                return
        }
        
        var yOffset = [CGFloat(0.0)]
        
        let activeWidth = collectionView.bounds.width - 2.0 * xOffset
        let allPaddings = CGFloat(colums - 1) * cellPadding
        
        cellWidth = (activeWidth - allPaddings / CGFloat(colums)) / CGFloat(colums)
        
        var yOffsetIndex = 0
        var _colum = 0
        
        // for Big One
//        let bigOneCellHeight = activeWidth
//        let indexPath = IndexPath(item: 0, section: 0)
//        let frame = CGRect(x: xOffset, y: yOffset[yOffsetIndex], width: activeWidth, height: bigOneCellHeight)
//
//        let insetFrame = frame.inset(by: UIEdgeInsets(top: cellPadding, left: 0.0, bottom: cellPadding, right: 0.0))
//
//        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//        attributes.frame = insetFrame
//        cache.append(attributes)
//        yOffset.append(cellPadding + bigOneCellHeight)
//        yOffsetIndex += 1
        
        // for rest cells
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            var y = yOffset[yOffsetIndex]
            
            if _colum > colums - 1  {
                _colum = 0
                yOffset.append(cellPadding + cellHeight + y)
                yOffsetIndex += 1
                y = yOffset[yOffsetIndex]
            }
            
            var x: CGFloat = 0.0
            
            if _colum == 0 {
                x = xOffset
            }else {
                x = xOffset + CGFloat(_colum) * cellWidth + CGFloat(_colum - 1) * cellPadding
            }
            
            
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            
            let insetFrame = frame.inset(by: UIEdgeInsets(top: cellPadding, left: cellPadding, bottom: cellPadding, right: cellPadding))
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            _colum += 1
        }
        
        contentHeight = cache.last?.frame.maxY ?? 0.0
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        let lastIndex = self.cache.endIndex
        guard let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cache[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cache[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}

