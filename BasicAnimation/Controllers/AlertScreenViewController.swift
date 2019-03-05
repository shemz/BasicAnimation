//
//  AlertScreenViewController.swift
//  BasicAnimation
//
//  Created by Shenbagavalli Lakshmanan on 2/19/19.
//  Copyright © 2019 Shenagavalli Lakshmanan. All rights reserved.
//

import UIKit

protocol AlertScreenViewControllerDelegate:class {
    func passChosenLevel(level: String)
}

class AlertScreenViewController: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    var levelPlayed: String = ""
    weak var delegate: AlertScreenViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.alpha = 0.9
        alertView.layer.cornerRadius = 10
        alertView.layer.masksToBounds = true
    }
    
    @IBAction func displayRootScreen(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func refreshLevel(_ sender: Any) {
        dismiss(animated: true, completion: {
            self.delegate?.passChosenLevel(level: self.levelPlayed)
        })
    }
    
}
