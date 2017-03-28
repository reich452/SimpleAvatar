//
//  SimpleAvatarView.swift
//  SimpleAvatar
//
//  Created by Ben Norris on 10/30/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

import UIKit

@IBDesignable open class SimpleAvatarView: UIView {
    
    // MARK: - Properties
    
    fileprivate let backgroundView = UIView()
    fileprivate let initialsLabel = UILabel()
    fileprivate let imageView = UIImageView()
    fileprivate let margin: CGFloat = 2.0
    
    @IBInspectable open var borderColor: UIColor = UIColor(red: 50 / 255.0, green: 137 / 255.0, blue: 68 / 255.0, alpha: 1.0) {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable open var innerBackgroundColor: UIColor = UIColor(red: 140 / 255.0, green: 189 / 255.0, blue: 74 / 255.0, alpha: 1.0) {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 8.0 {
        didSet {
            updateBorder()
        }
    }
    
    @IBInspectable open var firstName: String? {
        didSet {
            updateInitials()
        }
    }

    @IBInspectable open var lastName: String? {
        didSet {
            updateInitials()
        }
    }
    
    @IBInspectable open var image: UIImage? {
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
    
    open func reset() {
        imageView.image = nil
        initialsLabel.text = nil
    }
    
    
    // MARK: - Customized view methods
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let minSideSize = min(frame.size.width, frame.size.height)
        layer.cornerRadius = minSideSize / 2.0
        
        initialsLabel.font = UIFont.systemFont(ofSize: minSideSize / 2.5, weight: UIFontWeightLight)
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

        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: backgroundView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))

        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.textAlignment = .center
        addSubview(initialsLabel)
        
        initialsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        initialsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin).isActive = true
        trailingAnchor.constraint(equalTo: initialsLabel.trailingAnchor, constant: margin).isActive = true
        
        // Add image as an overlay to hide initials once it's been added
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        let views = ["backgroundView": backgroundView, "initialsLabel": initialsLabel, "imageView": imageView]
        let metrics = ["margin": margin]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: metrics, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: metrics, views: views))
    }
    
    func updateColors() {
        backgroundView.backgroundColor = innerBackgroundColor
        layer.borderColor = borderColor.cgColor
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
        if let firstName = firstName, firstName.characters.count > 0 {
            initialsString += firstName.substring(to: firstName.characters.index(after: firstName.startIndex))
        }
        if let lastName = lastName, lastName.characters.count > 0 {
            initialsString += lastName.substring(to: lastName.characters.index(after: lastName.startIndex))
        }
        if initialsString.characters.count == 0 {
            initialsString = "?"
        }
        return initialsString.uppercased()
    }
    
}
