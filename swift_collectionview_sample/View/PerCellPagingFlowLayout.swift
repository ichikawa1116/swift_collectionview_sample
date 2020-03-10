//
//  PerCellPagingFlowLayout.swift
//  swift_collectionview_sample
//
//  Created by Manami Ichikawa on 2018/10/27.
//  Copyright © 2018 Manami Ichikawa. All rights reserved.
//

import UIKit

class PerCellPagingFlowLayout: UICollectionViewFlowLayout {

    var cellWidth:CGFloat = 200
    let windowWidth:CGFloat = UIScreen.main.bounds.width
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var offsetAdjustment:CGFloat = CGFloat(MAXFLOAT)
        let horizontalOffest:CGFloat = proposedContentOffset.x + ( windowWidth - cellWidth ) / 2
        let targetRect = CGRect(x:proposedContentOffset.x,
                                y:0,
                                width:self.collectionView!.bounds.size.width,
                                height:self.collectionView!.bounds.size.height)
        
        let array = super.layoutAttributesForElements(in: targetRect)
        
        for layoutAttributes in array! {
            let itemOffset = layoutAttributes.frame.origin.x
            if abs(itemOffset - horizontalOffest) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - horizontalOffest
            }
        }
        
        return CGPoint(x:proposedContentOffset.x + offsetAdjustment, y:proposedContentOffset.y)
    }
}
