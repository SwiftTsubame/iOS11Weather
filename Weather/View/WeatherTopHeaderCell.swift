//
//  WeatherHeaderCell.swift
//  Weather
//
//  Created by Haiyan Ma on 10/05/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import LBTAComponents

class WeatherTopHeaderCell: DatasourceCell {
    
    let cityNameTextView: PassiveTextView = {
        let tv = PassiveTextView()
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
    }()
    
    let temperatureLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 88, weight: UIFontWeightThin))
        label.textAlignment = .center
        return label
    }()
    
    let todayLabel: WhiteLabel = {
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
    
    var topConstraint: NSLayoutConstraint?
    var maxHeaderHeight: CGFloat?
    
    override var datasourceItem: Any? {
        didSet {
            guard let weatherOverview = datasourceItem as? WeatherOverview else {
                return
            }
            let weatherOverviewViewModel = WeatherOverviewViewModel(weatherOverView: weatherOverview)
            cityNameTextView.attributedText = weatherOverviewViewModel.cityAndDescriptionAttributedString
            temperatureLabel.text = weatherOverviewViewModel.temperatureString
            todayLabel.text = weatherOverviewViewModel.weekDay
            temperatureLowLabel.text = weatherOverviewViewModel.low
            temperatureHighLabel.text = weatherOverviewViewModel.high
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(cityNameTextView)
        addSubview(temperatureLabel)
        addSubview(todayLabel)
        
        cityNameTextView.anchorCenterXToSuperview()
        topConstraint = cityNameTextView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.18)
        topConstraint?.isActive = true
        cityNameTextView.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.8).isActive = true
        cityNameTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        temperatureLabel.anchorCenterXToSuperview()
        temperatureLabel.topAnchor.constraint(equalTo: cityNameTextView.bottomAnchor, constant: -2).isActive = true
        temperatureLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.5).isActive = true
        
        let stackView = UIStackView.setupStackview(leftView: temperatureHighLabel, rightView: temperatureLowLabel, portionleft: 0.5, portionright: 0.5, spacing: 0)
        temperatureHighLabel.textAlignment = .left
        temperatureLowLabel.textAlignment = .right
        addSubview(stackView)
        
        _  = stackView.anchor(nil, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: GlobalConstant.margin, widthConstant: 66, heightConstant: 30)
        _ = todayLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: GlobalConstant.margin, bottomConstant: 0, rightConstant: 0, widthConstant: (GlobalConstant.screenWidth - 2 * GlobalConstant.margin) * 0.6, heightConstant: 30)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topConstraint?.constant = frame.height * 0.18
        
        let alpha = calculateAlpha()
        temperatureLabel.alpha = alpha
        temperatureLowLabel.alpha = alpha
        temperatureHighLabel.alpha = alpha
        todayLabel.alpha = alpha
    }
    
    func calculateAlpha() -> CGFloat {
        let transparentY = temperatureLabel.frame.height + temperatureLabel.frame.origin.y
        return max((frame.height - transparentY) / (WeatherHeaders.topHeader.defaultHeight - transparentY), 0)
    }
}


