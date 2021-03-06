//
//  SampleCollectionView.swift
//  swift_collectionview_sample
//
//  Created by Manami Ichikawa on 2018/10/27.
//  Copyright © 2018 Manami Ichikawa. All rights reserved.
//

import UIKit

class SampleCollectionView: UICollectionView {

    let cellIdentifier = "CustomCell"
    let colors:[UIColor] = [.blue,.yellow,.red,.green,.gray]
    let titles:[String] = ["1","2","3","4","5"]
    
    var isInfinity = true
    var pageTabItemsWidth: CGFloat = 0.0
    let pageCount = 5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        self.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        
        
        
        let layout = PerCellPagingFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: frame.height / 1.8)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = -5
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.collectionViewLayout = layout
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(frame: CGRect){
        let layout = PerCellPagingFlowLayout()
        layout.itemSize = CGSize(width: 200, height: frame.height / 1.5)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = -5
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cells = self.visibleCells
        for cell in cells {
            let cellCenter = self.convert(cell.center, to: nil)
            let screenCenterX = UIScreen.main.bounds.width / 2
            
            //真ん中までの距離
            let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)
            let s = -0.0009 * cellCenterDisX + 1
            cell.transform = CGAffineTransform(scaleX:s, y:s)
        }
    }
}

extension SampleCollectionView: UICollectionViewDelegate {
    
}

extension SampleCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isInfinity ? pageCount * 3 : pageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UICollectionViewCell, indexPath: IndexPath) {
        guard let cell = cell as? CustomCell else { return }
        let fixedIndex = isInfinity ? indexPath.row % pageCount : indexPath.row
        cell.contentView.layer.borderColor = colors[fixedIndex].cgColor
        cell.sampleLb.text = titles[fixedIndex]
    }
 
}

extension SampleCollectionView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isInfinity {
            if pageTabItemsWidth == 0.0 {
                pageTabItemsWidth = floor(scrollView.contentSize.width / 3.0) // 表示したい要素群のwidthを計算
            }
            
            if (scrollView.contentOffset.x <= 0.0) || (scrollView.contentOffset.x > pageTabItemsWidth * 2) { // スクロールした位置がしきい値を超えたら中央に戻す
                scrollView.contentOffset.x = pageTabItemsWidth
            }
        }
        
        guard let collectionView = scrollView as? SampleCollectionView else {
            return
        }
        
        let cells = collectionView.visibleCells
        print("cell count: \(cells.count)")
        for cell in cells {
            let cellCenter = self.convert(cell.center, to: nil)
            //let s = -0.00005 * pow(center.x, 2) + 1.5
            let screenCenterX = UIScreen.main.bounds.width / 2
            
            //真ん中までの距離
            let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)
            print(cellCenterDisX)
            //let s = abs(-0.00005 * pow(cellCenterDisX, 2) + 1.5)
            let s = -0.0009 * cellCenterDisX + 1
            let maxScale:CGFloat = 1
            let minScale:CGFloat = 0.8
            print("scale\(s)")
            cell.transform = CGAffineTransform(scaleX:s, y:s)
        }
    }
}



