//
//  ViewController.swift
//  SimpleAvatar
//
//  Created by Ben Norris on 10/30/15.
//  Copyright © 2015 Dev Mountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exampleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        exampleView.backgroundColor = UIColor.blue
        view.addSubview(exampleView)
        
        // not a UIView - must access view.addSubview(exampleView)
    }
    
    //-------------------- Notes  ----------------
    
    // @IBOutlet - gives you a connection to that conroll or to that view and your code
    // You are using an outlet when you want to change something on the code. 
    // @IBAction -  lets you respond to user ouput! 
    
    // @IBInspectable properties provide new access to an old feature: user-defined runtime attributes. Currently accessible from the identity inspector, these attributes have been available since before Interface Builder was integrated into Xcode. They provide a powerful mechanism for configuring any key-value coded property of an instance in a NIB, XIB, or storyboard:
    
    // Designing Intuitive User Experiences
    
    // didSet - when it sets something it is going to happen 
    
    // ViewController <-----> ViewController  -- always true 
    // a ViewController manages a view
    //                <<----->> == no
    //                <<-----> ==  no
    //                <----->> == no
    
    // a ViewController can have multiple views 
    // Anything you add becomes a subview . programatically we self.addSubview(whatYouWantToAdd)
    // the controller needs to controll views
    
    // Window
    
    // Frame - with: & height - gives you a size (CGSize)  &&  x: y: (CGPoint) - orgin
    
    // Auto Layout came out in 2012
    
    // What does it mean that this UIViewController ----- System defined. - You did not create this. It was given. 
    // You can only add a subView to a UIView same as self.addSubview(imageView)




}

