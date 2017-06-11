//
//  WeatherSecondHeader.swift
//  Weather
//
//  Created by Yanstar Studio on 11/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import LBTAComponents

class WeatherSecondHeader: DatasourceCell, UICollectionViewDelegateFlowLayout {
    
    lazy var cellCollectionView: DatasourceCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        let cv = DatasourceCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        return cv
    }()
    
    let topSeparator = SeparationLineView()
    let bottomSeparator = SeparationLineView()
    
    override var datasourceItem: Any? {
        didSet{
            guard let weatherHourly = datasourceItem as? [WeatherHourly] else {
                return
            }
            let datasource = HourlyWeatherDatasource(weatherHourly: weatherHourly)
            cellCollectionView.datasource = datasource
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(cellCollectionView)
        addSubview(topSeparator)
        addSubview(bottomSeparator)
        
        cellCollectionView.fillSuperview()
        
        topSeparator.anchorToTop(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        topSeparator.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
        
        bottomSeparator.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        bottomSeparator.heightAnchor.constraint(equalToConstant:  1 / UIScreen.main.scale).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 42, height: frame.height - 20)
    }
}


