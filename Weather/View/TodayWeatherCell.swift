//
//  TodayWeatherCell.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class TodayWeatherCell: DatasourceCell {
    
    let todayLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 16))
        label.numberOfLines = 0
        return label
    }()
    
    override var datasourceItem: Any? {
        didSet{
            guard let weatherLongDescription = datasourceItem as? WeatherLongDescription else { return }
            todayLabel.text = weatherLongDescription.description
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(todayLabel)
        todayLabel.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: GlobalConstant.margin, bottomConstant: 4, rightConstant: GlobalConstant.margin)
        separatorLineView.backgroundColor = UIColor.weatherSemiTransparent()
        separatorLineView.isHidden = false
    }
}
