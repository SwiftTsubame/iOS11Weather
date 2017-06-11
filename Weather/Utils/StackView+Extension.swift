//
//  StackView+Helper.swift
//  Weather
//
//  Created by Yanstar Studio on 13/05/17.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit

extension UIStackView {
    
    class func setupwWith(topView: UIView, middleView: UIView? = nil, bottomView: UIView, isHorizontal: Bool = true, spacing: CGFloat, addTo view: UIView, alignment: UIStackViewAlignment = .center) {
        
        let firstLabelContainerView = UIView()
        firstLabelContainerView.translatesAutoresizingMaskIntoConstraints = false
        let middleImageContainerView = UIView()
        middleImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        middleImageContainerView.isHidden = true
        let lastLabelContainerView = UIView()
        lastLabelContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [firstLabelContainerView, middleImageContainerView, lastLabelContainerView])
        
        let alignmentAxis: UILayoutConstraintAxis = isHorizontal ? .horizontal : .vertical
        
        stackView.axis = alignmentAxis
        stackView.alignment = alignment
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        view.addSubview(stackView)
        stackView.fillSuperview()
        
        firstLabelContainerView.addSubview(topView)
        topView.fillSuperview()

        if let middleView = middleView {
            middleImageContainerView.addSubview(middleView)
            middleView.fillSuperview()
            middleImageContainerView.isHidden = false
        }
        
        lastLabelContainerView.addSubview(bottomView)
        bottomView.fillSuperview()
    }
    
    class func setupStackview(leftView: UIView, rightView: UIView, alignment: UILayoutConstraintAxis = .horizontal, portionleft leftToSuperView: CGFloat, portionright rightToSuperView: CGFloat, spacing: CGFloat) -> UIStackView {
        
        // Create 2 views to contain image and text
        let leftViewContainer = UIView()
        leftViewContainer.addSubview(leftView)
        leftView.fillSuperview()
        leftViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let rightViewContainer = UIView()
        rightViewContainer.addSubview(rightView)
        rightView.fillSuperview()
        rightViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [leftViewContainer, rightViewContainer])
        
        if alignment == .horizontal {
            leftViewContainer.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: leftToSuperView).isActive = true
            rightViewContainer.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: rightToSuperView).isActive = true
        } else {
            rightViewContainer.widthAnchor.constraint(equalTo: leftViewContainer.widthAnchor, multiplier: 1) .isActive = true
            rightViewContainer.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: rightToSuperView).isActive = true
            leftViewContainer.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: leftToSuperView).isActive = true
        }
        
        stackView.axis = alignment
        stackView.distribution = .fillProportionally
        stackView.spacing = spacing
        return stackView
    }


}
