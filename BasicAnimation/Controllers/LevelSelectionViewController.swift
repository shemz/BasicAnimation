//
//  InitialViewController.swift
//  BasicAnimation
//
//  Created by Shenbagavalli Lakshmanan on 2/12/19.
//  Copyright © 2019 Shenagavalli Lakshmanan. All rights reserved.
//

import UIKit

class LevelSelectionViewController: UIViewController {
    
    var viewController:GameViewController?
    
    var chosenLevel = "basic"
    var logoShapes:[GameShape] = [.triangle, .circle, .square, .heart]
    
    @IBOutlet var logoShapesView: [UIView]!
    
    @IBOutlet weak var basicButton: UIButton! {
        didSet{
            basicButton.layer.cornerRadius = 10
            basicButton.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var advancedButton: UIButton! {
        didSet{
            advancedButton.layer.cornerRadius = 10
            advancedButton.clipsToBounds = true
        }
    }
    
    @IBAction func chooseLevel(_ sender: UIButton) {
        //Button tag 1 corresponds to 'Basic' and 2 corresponds to 'Advanced' levels
        print(sender.tag)
        switch sender.tag {
        case 1: self.chosenLevel = "basic"
        case 2: self.chosenLevel = "advanced"
        default: break
        }
        performSegue(withIdentifier: "moveToGame", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...3{
            ShapesGenerator.drawShape(logoShapes[i], in: logoShapesView[i], asSilhouette: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameViewController = (segue.destination as? GameViewController) {
            gameViewController.chosenLevel = self.chosenLevel
        }
    }
    
}
