//
//  DrawShapes.swift
//  BasicAnimation
//
//  Created by Shenbagavalli Lakshmanan on 1/16/19.
//  Copyright © 2019 Shenagavalli Lakshmanan. All rights reserved.
//

import UIKit

enum GameShape:String {
    case circle
    case triangle
    case oval
    case pentagon
    case hexagon
    case rectangle
    case heart
    case square
    case rhombus
    case trapezoid
    case parallelogram
    case star
}


class ShapesGenerator: UIViewController {
        
    static let lineWidth:CGFloat = 3.0
    static var asSilhouette:Bool = false
    
    class func drawShape(_ shapeName:GameShape, in shapeView:UIView, asSilhouette:Bool)
    {
        self.asSilhouette = asSilhouette
        switch shapeName {
        case .circle:
            self.drawCircle(drawIn: shapeView)
        case .triangle:
            self.drawTriangle(drawIn: shapeView)
        case .oval:
            self.drawOval(drawIn: shapeView)
        case .pentagon:
            self.drawPentagon(drawIn: shapeView)
        case .hexagon:
            self.drawHexagon(drawIn: shapeView)
        case .rectangle:
            self.drawRectangle(drawIn: shapeView)
        case .heart:
            self.drawHeart(drawIn: shapeView)
        case .square:
            self.drawSquare(drawIn: shapeView)
        case .rhombus:
            self.drawRhombus(drawIn: shapeView)
        case .trapezoid:
            self.drawTrapezoid(drawIn: shapeView)
        case .parallelogram:
            self.drawParallelogram(drawIn: shapeView)
        case .star:
            self.drawStar(drawIn: shapeView)
        }
    }
    private class func drawCircle(drawIn: UIView)
    {
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: drawIn.frame.width, height: drawIn.frame.height)).cgPath
        drawIn.layer.addSublayer(circleLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            circleLayer.fillColor = UIColor.black.cgColor
            circleLayer.strokeColor = UIColor.black.cgColor
        }
        else{
            circleLayer.fillColor = UIColor.red.cgColor
            circleLayer.strokeColor = UIColor.black.cgColor
        }
        circleLayer.lineWidth = lineWidth
    }
    private class func drawOval(drawIn: UIView)
    {
        let ovalLayer = CAShapeLayer()
        ovalLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: drawIn.frame.height/6, width: drawIn.frame.width, height: 3*drawIn.frame.height/4)).cgPath
        drawIn.layer.addSublayer(ovalLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            ovalLayer.strokeColor = UIColor.black.cgColor
            ovalLayer.fillColor = UIColor.black.cgColor
        }else
        {
            ovalLayer.strokeColor = UIColor.blue.cgColor
            ovalLayer.fillColor = UIColor.green.cgColor
        }
        ovalLayer.lineWidth = lineWidth
    }
    private class func drawTriangle(drawIn: UIView)
    {
        let triangleLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawIn.frame.width/2, y:0.0))
        path.addLine(to: CGPoint(x:0.0, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:drawIn.frame.height))
        path.closeSubpath()
        
        triangleLayer.path = path
        drawIn.layer.addSublayer(triangleLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            triangleLayer.fillColor = UIColor.black.cgColor
            triangleLayer.strokeColor = UIColor.black.cgColor
        }
        else{
            triangleLayer.fillColor = UIColor.blue.cgColor
            triangleLayer.strokeColor = UIColor.green.cgColor
        }
        triangleLayer.lineWidth = lineWidth
        
    }
    private class func drawPentagon(drawIn: UIView)
    {
        let pentagonLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawIn.frame.width/2, y:0.0))
        path.addLine(to: CGPoint(x:0.0, y:drawIn.frame.height/2))
        path.addLine(to: CGPoint(x:1*drawIn.frame.width/5, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:4*drawIn.frame.width/5, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:drawIn.frame.height/2))
        path.closeSubpath()
        
        pentagonLayer.path = path
        drawIn.layer.addSublayer(pentagonLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            pentagonLayer.fillColor = UIColor.black.cgColor
            pentagonLayer.strokeColor = UIColor.black.cgColor
        }else{
            pentagonLayer.fillColor = UIColor.yellow.cgColor
            pentagonLayer.strokeColor = UIColor.red.cgColor
        }
        pentagonLayer.lineWidth = lineWidth
        
    }
    
    private class func drawHexagon(drawIn: UIView)
    {
        let hexagonLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:25.0,y:0.0))
        path.addLine(to: CGPoint(x:0.0,y:drawIn.frame.height/2))
        path.addLine(to: CGPoint(x:25.0,y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:65.0,y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width,y:drawIn.frame.height/2))
        path.addLine(to: CGPoint(x:65.0,y:0.0))
        path.closeSubpath()
        
        hexagonLayer.path = path
        drawIn.layer.addSublayer(hexagonLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            hexagonLayer.fillColor = UIColor.black.cgColor
            hexagonLayer.strokeColor = UIColor.black.cgColor
        }else{
            hexagonLayer.fillColor = UIColor.green.cgColor
            hexagonLayer.strokeColor = UIColor.blue.cgColor
        }
        hexagonLayer.lineWidth = lineWidth
    }
    
    private class func drawRectangle(drawIn: UIView)
    {
        let rectLayer = CAShapeLayer()
        rectLayer.path = UIBezierPath(rect: CGRect(x: 0, y: drawIn.frame.height/6, width: drawIn.frame.width, height: 2*drawIn.frame.height/3)).cgPath
        drawIn.layer.addSublayer(rectLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            rectLayer.fillColor = UIColor.black.cgColor
            rectLayer.strokeColor = UIColor.black.cgColor
        }else{
            rectLayer.fillColor = UIColor.orange.cgColor
            rectLayer.strokeColor = UIColor.black.cgColor
        }
        rectLayer.lineWidth = lineWidth
    }

    private class func drawSquare(drawIn: UIView)
    {
        let squareLayer = CAShapeLayer()
        squareLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: drawIn.frame.width, height: drawIn.frame.height)).cgPath
        drawIn.layer.addSublayer(squareLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            squareLayer.fillColor = UIColor.black.cgColor
            squareLayer.strokeColor = UIColor.black.cgColor
        }else{
            squareLayer.fillColor = UIColor.purple.cgColor
            squareLayer.strokeColor = UIColor.green.cgColor
        }
        squareLayer.lineWidth = lineWidth
    }

    private class func drawHeart(drawIn: UIView)
    {
        let endRadian: Float = .pi
        let heartLayer = CAShapeLayer()
        let path = CGMutablePath()

        path.addArc(center: CGPoint(x:drawIn.frame.width/4,y:drawIn.frame.height/4), radius: drawIn.frame.width/4, startAngle: 0.0, endAngle: CGFloat(endRadian), clockwise: true)
        path.addLine(to: CGPoint(x:drawIn.frame.width/2,y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width,y:drawIn.frame.height/4))
        path.addArc(center: CGPoint(x:3*drawIn.frame.width/4,y:drawIn.frame.height/4), radius: drawIn.frame.width/4, startAngle: 0.0, endAngle: CGFloat(endRadian), clockwise: true)
        
        heartLayer.path = path
        drawIn.layer.addSublayer(heartLayer)

        //Fill color and border color based on view
        if asSilhouette{
            heartLayer.strokeColor = UIColor.black.cgColor
            heartLayer.fillColor = UIColor.black.cgColor
        }else{
            heartLayer.strokeColor = UIColor.yellow.cgColor
            heartLayer.fillColor = UIColor.red.cgColor
        }
        
        heartLayer.lineWidth = lineWidth
    }
    private class func drawRhombus(drawIn: UIView)
    {
        let rhombusLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawIn.frame.width/2, y:0.0))
        path.addLine(to: CGPoint(x:0.0, y:drawIn.frame.height/2))
        path.addLine(to: CGPoint(x:drawIn.frame.width/2, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:drawIn.frame.height/2))
        path.closeSubpath()
        
        rhombusLayer.path = path
        drawIn.layer.addSublayer(rhombusLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            rhombusLayer.fillColor = UIColor.black.cgColor
            rhombusLayer.strokeColor = UIColor.black.cgColor
        }else{
            rhombusLayer.fillColor = UIColor.purple.cgColor
            rhombusLayer.strokeColor = UIColor.blue.cgColor
        }
        rhombusLayer.lineWidth = lineWidth
        
    }
    private class func drawTrapezoid(drawIn: UIView)
    {
        let trapezoidLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:0.0, y:0.0))
        path.addLine(to: CGPoint(x:0.0, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:3*drawIn.frame.height/4))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:1*drawIn.frame.height/4))
        path.closeSubpath()
        
        trapezoidLayer.path = path
        drawIn.layer.addSublayer(trapezoidLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            trapezoidLayer.fillColor = UIColor.black.cgColor
            trapezoidLayer.strokeColor = UIColor.black.cgColor
        }else{
            trapezoidLayer.fillColor = UIColor.magenta.cgColor
            trapezoidLayer.strokeColor = UIColor.black.cgColor
        }
        trapezoidLayer.lineWidth = lineWidth
        
    }
    private class func drawParallelogram(drawIn: UIView)
    {
        let parallelogramLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawIn.frame.width/4, y:0.0))
        path.addLine(to: CGPoint(x:0.0, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:3*drawIn.frame.width/4, y:drawIn.frame.height))
        path.addLine(to: CGPoint(x:drawIn.frame.width, y:0.0))
        path.closeSubpath()
        
        parallelogramLayer.path = path
        drawIn.layer.addSublayer(parallelogramLayer)
        
        //Fill color and border color based on view
        if asSilhouette{
            parallelogramLayer.fillColor = UIColor.black.cgColor
            parallelogramLayer.strokeColor = UIColor.black.cgColor
        }else{
            parallelogramLayer.fillColor = UIColor.red.cgColor
            parallelogramLayer.strokeColor = UIColor.orange.cgColor
        }
        parallelogramLayer.lineWidth = lineWidth
        
    }
    
    private class func drawStar(drawIn: UIView)
    {
        let starLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawIn.frame.width/2, y:drawIn.frame.height/5))
        path.addLine(to: CGPoint(x: 5*drawIn.frame.width/8, y:4*drawIn.frame.height/5))
        path.addLine(to: CGPoint(x:2.5*drawIn.frame.width/8, y:2*drawIn.frame.height/5))
        path.addLine(to: CGPoint(x:5.5*drawIn.frame.width/8, y:2*drawIn.frame.height/5))
        path.addLine(to: CGPoint(x:3*drawIn.frame.width/8, y:4*drawIn.frame.height/5))
        path.closeSubpath()
        
        starLayer.path = path
        drawIn.layer.addSublayer(starLayer)
        
        //Fill color and border color based on the matchShapeSet; if it is true, fill star with yellow color,else fill with gray color.
        //This is used to differentiate between initial view load when stars will be gray and every succesful match, when the stars will be made yellow
        if asSilhouette{
            starLayer.fillColor = UIColor.gray.cgColor
            starLayer.strokeColor = UIColor.gray.cgColor
        }
        else{
            starLayer.fillColor = UIColor.yellow.cgColor
            starLayer.strokeColor = UIColor.yellow.cgColor
        }
        
        starLayer.lineWidth = lineWidth
        
    }

}
