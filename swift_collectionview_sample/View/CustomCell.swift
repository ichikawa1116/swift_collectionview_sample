//
//  CustomCell.swift
//  swift_collectionview_sample
//
//  Created by  on 2018/02/25.
//  Copyright © 2018 . All rights reserved.


import UIKit

class CustomCell: UICollectionViewCell {

    @IBOutlet weak var sampleLb: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let margin:CGFloat = 15
        let width:CGFloat = self.contentView.frame.width
        let height:CGFloat = self.contentView.frame.height
        sampleLb.frame = CGRect(x:margin,
                                  y:margin,
                                  width: width - margin * 2,
                                  height:height)
        sampleLb.textAlignment = .center
        sampleLb.textColor = UIColor.black
        sampleLb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        self.contentView.addSubview(sampleLb)
    }
    
    func setup() {
        // ここで配置する
//        let margin:CGFloat = 15
//        let width:CGFloat = self.contentView.frame.width
//        let height:CGFloat = self.contentView.frame.height
//        sampleLb.frame = CGRect(x:margin,
//                                  y:margin,
//                                  width: width - margin * 2,
//                                  height:height)
//        sampleLb.textAlignment = .center
//        sampleLb.textColor = UIColor.black
//        sampleLb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
//        self.contentView.addSubview(sampleLb)
        
        
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowOpacity = 0.7
        self.contentView.layer.shadowRadius = 5
        
    }
}
