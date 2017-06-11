//
//  HeaderLayout.swift
//  Weather
//
//  Created by Haiyan Ma on 10/05/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

class IOSWeatherCollectionViewLayout: UICollectionViewFlowLayout {
    
    var attributes: [UICollectionViewLayoutAttributes] = []
        
    override func prepare() {
        super.prepare()
        attributes = [] // Start with a fresh array of attributes
        guard let collectionView = collectionView else { return }
        
        // Add all item in sections into attributes
        let numberOfSections = collectionView.numberOfSections
        for section in 0..<numberOfSections {
            let headerIndexPath = IndexPath(item: 0, section: section)
            if let headerAttribute = layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: headerIndexPath)?.copy() {
                attributes.append(headerAttribute as! UICollectionViewLayoutAttributes)
            }
            let numberOfItems = collectionView.numberOfItems(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let attribute = layoutAttributesForItem(at: indexPath)?.copy() {
                    attributes.append(attribute as! UICollectionViewLayoutAttributes)
                }
            }
        }
    }
    
    // Telling our UICollectionViewLayout that it should be updating the layout while scrolling
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // We’ll use this constantly updating method to configure header and cell behaviours
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // Scroll offset
        let offset = collectionView?.contentOffset ?? CGPoint.zero
        
        // get all headers
        let headers = attributes.filter { attribute -> Bool in
            return attribute.representedElementKind == UICollectionElementKindSectionHeader
        }
        guard let topHeader = headers.first, let secondHeader = headers.last else { return nil }
        
        // Setup top header
        let topHeaderDefaultSize = topHeader.frame.size
        topHeader.frame.size.height = max(WeatherHeaders.topHeader.minimumHeight, topHeaderDefaultSize.height - offset.y)
        topHeader.frame.origin.y = offset.y
        
        // setup second header
        secondHeader.frame.origin.y = topHeader.frame.origin.y + topHeader.frame.size.height
        
        // Get all cells attributes
        let cells = attributes.filter { (attribute) -> Bool in
            return (attribute.representedElementKind != UICollectionElementKindSectionHeader) &&  (attribute.representedElementKind != UICollectionElementKindSectionFooter)
        }
        
        // limit the origin of all cells when scrolling
        let limit = secondHeader.frame.origin.y + secondHeader.frame.size.height
        for oneCell in cells {
            oneCell.frame.origin.y = limit
        }
        return attributes
    }
}
