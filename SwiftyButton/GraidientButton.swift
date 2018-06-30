//
//  GraidientButton.swift
//  SwiftyButton
//
//  Created by Myunkyu Park on 2018. 6. 30..
//  Copyright © 2018년 TakeScoop. All rights reserved.
//

import UIKit

@IBDesignable
class GraidientButton: UIButton {
    public enum Defaults {
        public static var colors = [
            UIColor(red: 255 / 255, green: 217 / 255, blue: 63 / 255, alpha: 1),
            UIColor(red: 248 / 255, green: 188 / 255, blue: 61 / 255, alpha: 1)
        ]
        public static var highlightedColors =  [UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)]
        public static var selectedColors =  [UIColor(red: 41 / 255, green: 128 / 255, blue: 185 / 255, alpha: 1)]
        public static var disabledColors = [UIColor(red: 149 / 255, green: 165 / 255, blue: 166 / 255, alpha: 1)]
        public static var cornerRadius: CGFloat = 6
    }
    
    @IBInspectable
    public var colors: [UIColor] = Defaults.colors {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable
    public var highlightedColors: [UIColor] = Defaults.highlightedColors {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable
    public var selectedColors: [UIColor] = Defaults.selectedColors {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable
    public var disabledColors: [UIColor] = Defaults.disabledColors {
        didSet {
            updateBackgroundImages()
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = Defaults.cornerRadius {
        didSet {
            updateBackgroundImages()
        }
    }
    
    // MARK: - UIButton
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        updateBackgroundImages()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        updateBackgroundImages()
    }
    
    // MARK: - Internal methods
    
    fileprivate func configure() {
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    fileprivate func updateBackgroundImages() {
        
        let normalImage = Utils.gradientButtonImage(colors: colors, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        let highlightedImage = Utils.gradientHighlightedButtonImage(colors: highlightedColors, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius, buttonPressDepth: 0)
        let selectedImage = Utils.gradientButtonImage(colors: selectedColors, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        let disabledImage = Utils.gradientButtonImage(colors: disabledColors, shadowHeight: 0, shadowColor: .clear, cornerRadius: cornerRadius)
        
        setBackgroundImage(normalImage, for: .normal)
        setBackgroundImage(highlightedImage, for: .highlighted)
        setBackgroundImage(selectedImage, for: .selected)
        setBackgroundImage(disabledImage, for: .disabled)
    }}
