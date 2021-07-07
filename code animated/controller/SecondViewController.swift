//
//  SecondViewController.swift
//  code animated
//
//  Created by 黃肇祺 on 2021/7/5.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let firstImageView = UIImageView(image: UIImage(named: "001"))
        firstImageView.frame = view.frame
        firstImageView.contentMode = .scaleAspectFill
        view.addSubview(firstImageView)
        
        imageFadeIn(imageView: firstImageView)
    }
    
    
    func imageFadeIn(imageView: UIImageView) {
        
        let secondImageView = UIImageView(image: UIImage(named: "002"))
        secondImageView.frame = view.frame
        secondImageView.contentMode = .scaleAspectFill
        secondImageView.alpha = 0.0
        
        view.insertSubview(secondImageView, aboveSubview: imageView)
        
        UIView.animate(withDuration: 2.0, delay: 2.0, options: .curveEaseOut) {
            secondImageView.alpha = 1.0
        } completion: { _ in
            imageView.image = secondImageView.image
            secondImageView.removeFromSuperview()
        }

    }
    

}
