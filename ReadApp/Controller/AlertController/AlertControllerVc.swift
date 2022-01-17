//
//  AlertControllerVc.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

class AlertControllerVc: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var okButton: UIButton!
    var originalCentre:CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.alpha = 0
        originalCentre = containerView.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        containerView.transform =  CGAffineTransform(scaleX: 0.3, y: 2)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .allowUserInteraction) {
            self.containerView.transform = .identity
            
        } 
        containerView.alpha = 1

    }
    
    func setUpUI() {
        okButton.layer.cornerRadius = okButton.frame.height / 2
        okButton.clipsToBounds = true
        okButton.layer.masksToBounds = true
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
