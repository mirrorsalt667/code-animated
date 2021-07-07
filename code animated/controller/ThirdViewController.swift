//
//  ThirdViewController.swift
//  code animated
//
//  Created by 黃肇祺 on 2021/7/6.
//

import UIKit

class ThirdViewController: UIViewController {

    var alertView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
        
        
    }
    
    
    func createView() {
        
        let alertWidth: CGFloat = view.bounds.width
        let alertHeight: CGFloat = view.bounds.height
        let alertViewFrame: CGRect = CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight)
        
        alertView = UIView(frame: alertViewFrame) //製造藍色的view
        alertView.backgroundColor = UIColor.blue
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight/2)) //alertView高度的一半
        imageView.image = UIImage(named: "car")
        imageView.contentMode = .scaleAspectFill
        alertView.addSubview(imageView)  //imageView是建立在alertView上面，表示他們會一起移動。
        
        
        let button = UIButton(type: UIButton.ButtonType.system) //系統預設buttonType
        button.setTitle("Dismiss", for: UIControl.State.normal)
        button.backgroundColor = UIColor.white
        let buttonWidth: CGFloat = alertWidth/2  //alertView寬度的一半
        let buttonHeight: CGFloat = 40
        button.frame = CGRect(x: alertView.center.x - buttonWidth/2, y: alertView.center.y - buttonHeight/2, width: buttonWidth, height: buttonHeight)
        
        button.addTarget(self, action: #selector(ThirdViewController.dismissAlert), for: .touchUpInside)
        
        
        /*button.addTarget(self, action: Selector("dismissAlert"), for: UIControl.Event.touchUpInside)*/
        
        alertView.addSubview(button)
        view.addSubview(alertView)
        
    }
    
    @objc func dismissAlert() {
        
        let bounds = alertView.bounds
        let frame = alertView.frame.size
        let finalWidth = frame.width / 4
        let finalHeight = frame.height / 4
        
        let snapshot = alertView.snapshotView(afterScreenUpdates: false)!
        snapshot.frame = alertView.frame
        view.addSubview(snapshot)
        alertView.removeFromSuperview()
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeCubic) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                snapshot.frame = CGRect(x: self.view.center.x - finalWidth/2, y: self.view.center.y - finalHeight/2, width: finalWidth, height: finalHeight)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                snapshot.frame = CGRect(x: self.view.center.x - finalWidth/2, y: bounds.height, width: finalWidth, height: finalHeight)
            }
        }

        
    }


}
