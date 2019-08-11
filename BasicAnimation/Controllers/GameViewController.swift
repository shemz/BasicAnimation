//
//  ViewController.swift
//  BasicAnimation
//
//  Created by Shenbagavalli Lakshmanan on 12/31/18.
//  Copyright © 2018 CK. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, AlertScreenViewControllerDelegate {
    @IBOutlet var starViews: [UIView]!
    @IBOutlet weak var shapeOneView: UIView!
    @IBOutlet weak var shapeTwoView: UIView!
    @IBOutlet weak var shapeThreeView: UIView!
    @IBOutlet weak var matchShapeView: UIView!
    @IBOutlet weak var shapePanelView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    
    var matchShape:GameShape = .rectangle
    var basicShapesArray:[GameShape] = [.rectangle,.square,.circle,.triangle,.oval]
    var advancedShapesArray:[GameShape] = [.heart,.hexagon,.pentagon,.rhombus,.trapezoid,.parallelogram]

    var shapesArray:[GameShape] = [GameShape](repeating: GameShape.rectangle, count: 10)
    var randomShapes:[GameShape] = [GameShape](repeating: GameShape.rectangle, count: 3)
    
    var location = CGPoint.zero
    var shapePanelLocation = CGPoint.zero
    var shapeOneInitLocation = CGPoint.zero
    var shapeTwoInitLocation = CGPoint.zero
    var shapeThreeInitLocation = CGPoint.zero
    var matchShapeInitLocation = CGPoint.zero

    var shapesArrayIndex = 0
    var matchCounter = 0
    var matchFound:Bool = false
    var chosenLevel: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        switch chosenLevel{
        case "basic":
            shapesArray = self.basicShapesArray
            levelLabel.text = "BASIC"
        case "advanced":
            shapesArray = self.advancedShapesArray
            levelLabel.text = "ADVANCED"
        default:
            shapesArray = self.basicShapesArray
            levelLabel.text = "BASIC"
            print("default shapesArray")
        }
        print(shapesArray)
        
        drawShapesInShapeViews()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Obtain initial positions of the three shapes w.r.t. the shapePanelView
        initializeShapesLocation()
        
        //Draw star in gray color; when star is drawn as a silhoutte it is filled with gray color, else with yellow color
        for i in 0...4{
            ShapesGenerator.drawShape(.star, in: starViews[i], asSilhouette: true)
        }
    }
    
    @IBAction func displayInitialScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
   //     navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func refreshLevel(_ sender: Any) {
        refreshLevel()
    }
    
    func initializeShapesLocation(){
        shapeOneInitLocation = shapeOneView.center
        shapeTwoInitLocation = shapeTwoView.center
        shapeThreeInitLocation = shapeThreeView.center
        matchShapeInitLocation = matchShapeView.center
    }
    
    func drawShapesInShapeViews()
    {
        randomizeShapes()
        ShapesGenerator.drawShape(randomShapes[0], in: shapeOneView, asSilhouette: false)
        ShapesGenerator.drawShape(randomShapes[1], in: shapeTwoView, asSilhouette: false)
        ShapesGenerator.drawShape(randomShapes[2], in: shapeThreeView, asSilhouette: false)

        //Choose one shape from the randomShapes array to be drawn in black
        let randomIndex = Int(arc4random_uniform(UInt32(randomShapes.count)))
        matchShape =  randomShapes[randomIndex]
        matchShapeView.alpha = 1.0
        ShapesGenerator.drawShape(matchShape, in: matchShapeView, asSilhouette: true)
    }
    
    //Function returns 3 random shapes in randomShapes from the available list of shapes in shapesArray
    func randomizeShapes()
    {
        //matchFound false indicates initial load of app
        if !matchFound{
            shapesArray.shuffle()
            for i in (0...2)
            {
                randomShapes[i] = shapesArray[shapesArrayIndex]
                shapesArrayIndex+=1
            }
        }
        else{
            for i in (0...2)
            {
                if randomShapes[i] == matchShape
                {
                    //while loop is used to find the next shape from shapesArray that is not already on screen (ie, in random shapes)
                    while randomShapes.contains(shapesArray[shapesArrayIndex]){
                        if shapesArrayIndex < (shapesArray.count - 1){
                            shapesArrayIndex += 1
                        }
                        else{
                            shapesArrayIndex = 0
                        }
                    }
                    randomShapes[i] = shapesArray[shapesArrayIndex]
                }
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        
        shapePanelLocation = self.view.convert(location, to: shapePanelView)
        switch touch.view {
        case shapeOneView:
            shapeOneView.center = shapePanelLocation
        case shapeTwoView:
            shapeTwoView.center = shapePanelLocation
        case shapeThreeView:
            shapeThreeView.center = shapePanelLocation
        default:
            print("Default touch")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        
        shapePanelLocation = self.view.convert(location, to: shapePanelView)
        
        //identify if the shape of the moving view and matchShape match
        var movingShape: GameShape = randomShapes[0]
        
        switch touch.view {
        case shapeOneView:
            movingShape = randomShapes[0]
        case shapeTwoView:
            movingShape = randomShapes[1]
        case shapeThreeView:
            movingShape = randomShapes[2]
        default:
            print("Default touch")
        }
        
        if matchShapeView.frame.contains(shapePanelLocation) && movingShape == matchShape {
            matchShapeView.alpha = 0.0
            touch.view?.center = matchShapeView.center
            matchFound = true
        }
        else {
            switch touch.view {
            case shapeOneView:
                shapeOneView.center = shapeOneInitLocation
            case shapeTwoView:
                shapeTwoView.center = shapeTwoInitLocation
            case shapeThreeView:
                shapeThreeView.center = shapeThreeInitLocation
            default:
                print("Default touch")
            }
        }
        if matchFound {
            PartySupplies.emitConfetti(in: shapePanelView, emitShape: .point, emitPosition: self.matchShapeInitLocation, for: 1.0)
                self.matchCounter += 1
                if self.matchCounter <= 5 {
                    
                    //Remove the Star sublayer with gray color before proceeding to draw with yellow color
                    self.starViews[self.matchCounter-1].layer.sublayers?.removeAll()
                    //set isMatchShape to true to fill the star in yellow color
                    ShapesGenerator.drawShape(.star, in: self.starViews[self.matchCounter-1], asSilhouette: false)
                }
                if self.matchCounter < 5 {
                    //remove sublayer of all views in shape panel
                    self.removeShapeSublayers()
                    self.resetShapesPosition()
                    self.drawShapesInShapeViews()
                    self.matchFound = false
                    
                }
                else {
                    PartySupplies.emitConfetti(in: shapePanelView, emitShape: .line, emitPosition: CGPoint.zero, for: 3.0)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) { [weak self] in
                        self?.performSegue(withIdentifier: "displayAlert", sender: self)
                    }
                }
            
        }
    }

    func refreshLevel(){
        shapesArrayIndex = 0
        matchCounter = 0
        matchFound = false
        
        removeShapeSublayers()
        drawShapesInShapeViews()
        resetShapesPosition()
        //Draw star in gray color; if star is drawn as silhoutte it will be in gray, else it will be in yellow color
        for i in 0...4{
            ShapesGenerator.drawShape(.star, in: starViews[i], asSilhouette: true)
        }
    }
    
    func resetShapesPosition(){
        shapeOneView.center = shapeOneInitLocation
        shapeTwoView.center = shapeTwoInitLocation
        shapeThreeView.center = shapeThreeInitLocation
        matchShapeView.center = matchShapeInitLocation
    }
    
    func removeShapeSublayers(){
        matchShapeView.layer.sublayers?.removeAll()
        shapeOneView.layer.sublayers?.removeAll()
        shapeTwoView.layer.sublayers?.removeAll()
        shapeThreeView.layer.sublayers?.removeAll()
    }


//Prepare for alert screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue to AlertScreen")
        let alertScreenViewController = (segue.destination as! AlertScreenViewController)
        alertScreenViewController.modalPresentationStyle = .overCurrentContext
        alertScreenViewController.delegate = self
        alertScreenViewController.levelPlayed = chosenLevel
    }
    
    func passChosenLevel(level: String) {
        print("protocol stubs")
        refreshLevel()
    }
}

