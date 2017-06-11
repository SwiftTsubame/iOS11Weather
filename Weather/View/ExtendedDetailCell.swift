//
//  ExtendedDetailCell.swift
//  Weather
//
//  Created by Haiyan Ma on 08/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class ExtendedDetailCell: DatasourceCell {
    
    private let extendedInfoTextView: PassiveTextView = {
        let tv = PassiveTextView()
        return tv
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let detail = datasourceItem as? [ExtendedInfo : String] else { return }
            
            for (key, value) in detail {
                let attributedText = NSMutableAttributedString.setupWithText(key.stringValue, description: "\n\(value)",
                    textFont: UIFont.systemFont(ofSize: 14),
                    descriptionFont: UIFont.systemFont(ofSize: 28),
                    textColor: UIColor.weatherSemiTransparent(),
                    descriptionColor: .white)
                attributedText?.setLineSpacing(1.0)
                extendedInfoTextView.attributedText = attributedText
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(extendedInfoTextView)
        extendedInfoTextView.fillSuperview()
        separatorLineView.backgroundColor = UIColor.weatherSemiTransparent()
        separatorLineView.isHidden = false
    }
}
