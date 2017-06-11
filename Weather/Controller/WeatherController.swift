//
//  ViewController.swift
//  Weather
//
//  Created by Haiyan Ma on 22/05/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//
import UIKit
import LBTAComponents
import TRON
import SwiftyJSON

class WeatherController: DatasourceController {
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "daytimeClear")
        iv.clipsToBounds = true
        return iv
    }()
    
    let errorMessageLabel: WhiteLabel = {
        let label = WhiteLabel(font: UIFont.systemFont(ofSize: 18))
        label.text = "Sorry, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupErrorMessageLabel()
        setupCollectionView()
        fetchWeather()
    }
    
    fileprivate func setupErrorMessageLabel() {
        view.addSubview(errorMessageLabel)
        errorMessageLabel.anchorCenterSuperview()
        errorMessageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        errorMessageLabel.equalHeightToWidth()
    }
    
    fileprivate func setupCollectionView() {
        collectionView?.collectionViewLayout = IOSWeatherCollectionViewLayout()
        collectionView?.backgroundView = backgroundImageView
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.alwaysBounceVertical = true
    }
    
    fileprivate func fetchWeather() {
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.startAnimating()
        Service.sharedInstance.fetchWeather { (weatherDatasource, error) in
            guard error == nil else {
                self.errorMessageLabel.isHidden = false
                self.activityIndicatorView.stopAnimating()
                return
            }
            self.errorMessageLabel.isHidden = true
            self.datasource = weatherDatasource
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let headerHeightMaxChange = WeatherHeaders.topHeader.defaultHeight - WeatherHeaders.topHeader.minimumHeight
        var subOffset: CGFloat = 0
        if offsetY > headerHeightMaxChange {
            subOffset = offsetY - headerHeightMaxChange
        } else {
            subOffset = 0
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationNames.setOffset), object: subOffset)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 720)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var height: CGFloat = WeatherHeaders.topHeader.defaultHeight
        if section != WeatherHeaders.topHeader.section {
            height = WeatherHeaders.centerHeader.defaultHeight
        }
         return CGSize(width:view.frame.width, height: height)
    }
}


