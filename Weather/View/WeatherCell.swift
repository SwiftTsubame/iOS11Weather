//
//  WeatherCell.swift
//  Weather
//
//  Created by Haiyan Ma on 10/05/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import LBTAComponents

class WeatherCell: DatasourceCell, UICollectionViewDelegateFlowLayout {
    
    lazy var cellCollectionView: DatasourceCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        let cv = DatasourceCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.isScrollEnabled = false
        return cv
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let weatherModel = datasourceItem as? WeatherModel else {
                return }
            configDatasource(weatherModel: weatherModel)
        }
    }

    override func setupViews() {
        super.setupViews()
        configViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSetOffset), name: Notification.Name(rawValue: NotificationNames.setOffset), object: nil)
    }
    
    fileprivate func configViews() {
        addSubview(cellCollectionView)
        cellCollectionView.fillSuperview()
    }
    
    fileprivate func configDatasource(weatherModel: WeatherModel) {
        let weatherCellDetailDatasource = WeatherCellDetailDatasource(weatherModel: weatherModel)
        cellCollectionView.datasource = weatherCellDetailDatasource
    }
    
    func handleSetOffset(notification: Notification) {
        if let offset = notification.object as? CGFloat {
            cellCollectionView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width, height: WeatherCells.todayDescription.defaultHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: frame.width, height: WeatherCells.dailyCells.defaultHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: frame.width, height: WeatherCells.extendedInfoCells.defaultHeight)
    }
}

