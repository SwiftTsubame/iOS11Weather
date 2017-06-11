//
//  HourlyWeatherCell.swift
//  Weather
//
//  Created by Yanstar Studio on 14/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import LBTAComponents

class DailyWeatherCell: DatasourceCell, UICollectionViewDelegateFlowLayout {
    
    lazy var cellCollectionView: DatasourceCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: GlobalConstant.margin, bottom: 0, right: GlobalConstant.margin)
        let cv = DatasourceCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.isScrollEnabled = false
        return cv
    }()
    
    override var datasourceItem: Any? {
        didSet{
            guard let dailyWeather = datasourceItem as? [WeatherDaily] else {
                return
            }
            setDatasource(dailyWeather: dailyWeather)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        configViews()
    }
    
    fileprivate func configViews() {
        addSubview(cellCollectionView)
        cellCollectionView.fillSuperview()
        separatorLineView.backgroundColor = UIColor.weatherSemiTransparent()
        separatorLineView.isHidden = false
    }
    
    fileprivate func setDatasource(dailyWeather: [WeatherDaily]) {
        let dailyWeatherDatasource = DailyWeatherDatasource(dailyWeather: dailyWeather)
        cellCollectionView.datasource = dailyWeatherDatasource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 2 * GlobalConstant.margin, height: 30)
    }
}


