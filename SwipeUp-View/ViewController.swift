//
//  ViewController.swift
//  SwipeUp-View
//
//  Created by NETBIZ on 20/02/19.
//  Copyright © 2019 Netbiz.in. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var swipeUpView: UIView!
    var isVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeUpGest = UISwipeGestureRecognizer.init(target: self, action: #selector(showSwipeView))
        swipeUpGest.direction = .up
        swipeUpView.addGestureRecognizer(swipeUpGest)
        view.addGestureRecognizer(swipeUpGest)
        
        
        let swipeDownGest = UISwipeGestureRecognizer.init(target: self, action: #selector (hideSwipeView))
        swipeDownGest.direction = .down
        swipeUpView.addGestureRecognizer(swipeDownGest)
        view.addGestureRecognizer(swipeDownGest)
    }
    
    @objc func showSwipeView(){
        print("Shown")
        isVisible = true
//        bottomConstraint.constant = 470 //(500-30)
//        swipeUpView.layer.cornerRadius = 20
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
//        swipeUpView.layer.opacity = 1.0
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.bottomConstraint.constant = 470 //(500-30)
            self.swipeUpView.layer.cornerRadius = 20
            self.swipeUpView.layer.opacity = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func hideSwipeView(){
        print("Hidden")
        isVisible = false
//        bottomConstraint.constant = 30
//        swipeUpView.layer.cornerRadius = 10
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
//        swipeUpView.layer.opacity = 0.5
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.bottomConstraint.constant = 30
            self.swipeUpView.layer.cornerRadius = 10
            self.swipeUpView.layer.opacity = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func showViewAnim(){
        isVisible = true
        bottomConstraint.constant = view.frame.size.height-30
        swipeUpView.layer.cornerRadius = 20
        let animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut, animations: {
            self.view.layoutIfNeeded()
        })
        animator.startAnimation()
        
    }
    func hideViewAnim(){
        isVisible = false
        bottomConstraint.constant = 30
        swipeUpView.layer.cornerRadius = 10
        let animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut, animations: {
            self.view.layoutIfNeeded()
        })
        animator.startAnimation()
    }
    @IBAction func buttonClick(_ sender: Any) {
        swipeUpView.layer.opacity = 1.0
        if isVisible {
            hideViewAnim()
        }
        else{
            showViewAnim()
        }
    }
    
}

