//
//  DailyDetailCell.swift
//  Weather
//
//  Created by Haiyan Ma on 08/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class DailyDetailCell: DatasourceCell {
    let dayLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 19))
        return label
    }()
    
    let temperatureHighLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 19))
        return label
    }()
    
    let temperatureLowLabel: SemiTransparentLabel = {
        let label = SemiTransparentLabel(font: UIFont.systemFont(ofSize: 19))
        return label
    }()
    
    let weatherIcon: AutoFittingImageView = {
        let iv = AutoFittingImageView()
        return iv
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let weatherDaily = datasourceItem as? WeatherDaily else {
                return
            }
            let weatherDailyViewModel = WeatherDailyViewModel(weatherDaily: weatherDaily)
            dayLabel.text = weatherDailyViewModel.weekDay
            weatherIcon.image = weatherDailyViewModel.weatherImage
            temperatureLowLabel.text = weatherDailyViewModel.low
            temperatureHighLabel.text = weatherDailyViewModel.high
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(weatherIcon)
        addSubview(dayLabel)
        
        weatherIcon.anchorCenterSuperview()
        weatherIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        weatherIcon.equalWidthToHeight()
        
        dayLabel.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: weatherIcon.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 4)
        
        let stackView = UIStackView.setupStackview(leftView: temperatureHighLabel, rightView: temperatureLowLabel, portionleft: 0.5, portionright: 0.5, spacing: 0)
        temperatureHighLabel.textAlignment = .left
        temperatureLowLabel.textAlignment = .right
        addSubview(stackView)
        stackView.anchorWithConstantsToTop(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        stackView.widthAnchor.constraint(equalToConstant: 66).isActive = true
    }
}
