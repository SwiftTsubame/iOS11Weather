//
//  SeparationLineView.swift
//  Weather
//
//  Created by Haiyan Ma on 08/06/2017.
//  Copyright © 2017 Tsubame. All rights reserved.
//

import UIKit
import LBTAComponents

class SeparationLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func defaultSetup() {
        backgroundColor = UIColor.weatherSemiTransparent()
    }
}

class WeatherWhiteLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(font: UIFont? = nil) {
        super.init(frame: .zero)
        self.font = font
        defaultSetup()
    }
    
    func defaultSetup() {
        textColor = UIColor.weatherWhite()
    }
}

class WhiteLabel: WeatherWhiteLabel {
    override func defaultSetup() {
        super.defaultSetup()
        textColor = .white
    }
}

class SemiTransparentLabel: WeatherWhiteLabel {
    override func defaultSetup() {
        super.defaultSetup()
        textColor = UIColor.weatherSemiTransparent()
    }
}

class PassiveTextView: UITextView {
    public init() {
        super.init(frame: .zero, textContainer: nil)
        backgroundColor = .clear
        isEditable = false
        isScrollEnabled = false
        isSelectable = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AutoFittingImageView: UIImageView {
    public init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


