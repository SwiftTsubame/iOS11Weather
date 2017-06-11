//
//  VerticalWeatherCell.swift
//  Weather
//
//  Created by Yanstar Studio on 13/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class VerticalWeatherCell: DatasourceCell, WeatherFormatable {
    
    let hourLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 18))
        label.textAlignment = .center
        return label
    }()
    
    let temperatureLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 18))
        label.textAlignment = .center
        return label
    }()
    
    let weatherIcon: AutoFittingImageView = {
        let iv = AutoFittingImageView()
        return iv
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let weatherHourly = datasourceItem as? WeatherHourly else {
                return
            }
            hourLabel.text = weatherHourly.hour
            temperatureLabel.text = addDegreeSign(toNumber: weatherHourly.temperature ?? 0)
            if let imageIconName = weatherHourly.description?.stringValue {
                weatherIcon.image = UIImage(named: imageIconName)
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(hourLabel)
        addSubview(temperatureLabel)
        addSubview(weatherIcon)
        
        weatherIcon.anchorCenterSuperview()
        weatherIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        weatherIcon.equalHeightToWidth()
        
        temperatureLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        hourLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
    }
}

