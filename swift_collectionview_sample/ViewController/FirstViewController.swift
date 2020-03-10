//
//  FirstViewController.swift
//  swift_collectionview_sample
//
//  Created by  on 2018/02/25.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegateFlowLayout,  UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: SampleCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        self.collectionView.register(UINib (nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return self.collectionView.pageCount * 3
    }

    
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        cell.sampleLb.textAlignment = NSTextAlignment.center
//        cell.sampleLb.text = String(indexPath.row)
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellSize:CGFloat = self.view.bounds.width/1.3
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(50 , 20 , 50 , 20 )  //マージン(top , left , bottom , right)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

