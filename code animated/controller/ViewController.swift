//
//  ViewController.swift
//  code animated
//
//  Created by 黃肇祺 on 2021/7/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    @IBOutlet weak var leadingUsername: NSLayoutConstraint!
    @IBOutlet weak var trallingUsername: NSLayoutConstraint!
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(view.bounds.width)
        centerAlignUsername.constant -= self.view.bounds.width
        leadingUsername.constant -= self.view.bounds.width
        trallingUsername.constant += self.view.bounds.width
        centerAlignPassword.constant -= self.view.bounds.width
        myButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut) {
            self.centerAlignUsername.constant += self.view.bounds.width
            self.leadingUsername.constant += self.view.bounds.width
            self.trallingUsername.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut) {
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut) {
            self.myButton.alpha = 1
            self.view.layoutIfNeeded()
        }

        
    }
    

    @IBAction func myButton(_ sender: Any) {
        let bounds = self.myButton.bounds
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10) { //springWithDamping 彈力 １沒彈力 ０最彈
            self.myButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.myButton.isEnabled = false
        }
    }
    
}

