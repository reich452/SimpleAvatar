//
//  SimpleAvatarView.swift
//  SimpleAvatar
//
//  Created by Ben Norris on 10/30/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

import UIKit

@IBDesignable public class SimpleAvatarView: UIView {
    
    // MARK: - Properties
    
    private let backgroundView = UIView()
    private let initialsLabel = UILabel()
    private let imageView = UIImageView()
    private let margin: CGFloat = 2.0
    
    @IBInspectable public var borderColor: UIColor = UIColor(red: 50 / 255.0, green: 137 / 255.0, blue: 68 / 255.0, alpha: 1.0) {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable public var innerBackgroundColor: UIColor = UIColor(red: 140 / 255.0, green: 189 / 255.0, blue: 74 / 255.0, alpha: 1.0) {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 8.0 {
        didSet {
            updateBorder()
        }
    }
    
    @IBInspectable public var firstName: String? {
        didSet {
            updateInitials()
        }
    }

    @IBInspectable public var lastName: String? {
        didSet {
            updateInitials()
        }
    }
    
    @IBInspectable public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }

    
    // MARK: - Initialization
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    
    // MARK: - Public API
    
    public func reset() {
        imageView.image = nil
        initialsLabel.text = nil
    }
    
    
    // MARK: - Customized view methods
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let minSideSize = min(frame.size.width, frame.size.height)
        layer.cornerRadius = minSideSize / 2.0
        
        initialsLabel.font = UIFont.systemFontOfSize(minSideSize / 2.5, weight: UIFontWeightLight)
    }
    
}


// MARK: - Private methods

private extension SimpleAvatarView {
    
    func configureViews() {
        updateColors()
        updateBorder()
        
        clipsToBounds = true
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)

        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0))

        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.textAlignment = .Center
        addSubview(initialsLabel)
        
        initialsLabel.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
        initialsLabel.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: margin).active = true
        trailingAnchor.constraintEqualToAnchor(initialsLabel.trailingAnchor, constant: margin).active = true
        
        // Add image as an overlay to hide initials once it's been added
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        addSubview(imageView)
        
        let views = ["backgroundView": backgroundView, "initialsLabel": initialsLabel, "imageView": imageView]
        let metrics = ["margin": margin]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: [], metrics: metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: [], metrics: metrics, views: views))
    }
    
    func updateColors() {
        backgroundView.backgroundColor = innerBackgroundColor
        layer.borderColor = borderColor.CGColor
        initialsLabel.textColor = borderColor
    }
    
    func updateBorder() {
        layer.borderWidth = borderWidth
    }
    
    func updateInitials() {
        initialsLabel.text = initials()
    }
    
    func initials() -> String {
        var initialsString = String()
        if let firstName = firstName where firstName.characters.count > 0 {
            initialsString += firstName.substringToIndex(firstName.startIndex.successor())
        }
        if let lastName = lastName where lastName.characters.count > 0 {
            initialsString += lastName.substringToIndex(lastName.startIndex.successor())
        }
        if initialsString.characters.count == 0 {
            initialsString = "?"
        }
        return initialsString.uppercaseString
    }
    
}
