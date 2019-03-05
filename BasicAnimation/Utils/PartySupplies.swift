//
//  GenerateConfetti.swift
//  BasicAnimation
//
//  Created by Shenbagavalli Lakshmanan on 2/7/19.
//  Copyright © 2019 Shenagavalli Lakshmanan. All rights reserved.
//

import UIKit

enum EmitShape {
    case line
    case point
}


class PartySupplies: UIViewController {
    
    
    static var confettiBurst:Bool = false
    
    class func emitConfetti(in view: UIView, emitShape: EmitShape, emitPosition: CGPoint, for seconds:TimeInterval)
    {
        let particleEmitter = CAEmitterLayer()
        particleEmitter.name = "confettilayer"
        confettiBurst = false
        
        switch emitShape {
        case .line:
            particleEmitter.emitterShape = .line
            particleEmitter.emitterPosition = CGPoint(x: 250, y: view.bounds.origin.y)
        case .point:
            particleEmitter.emitterShape = .point
            particleEmitter.emitterPosition = CGPoint(x: emitPosition.x, y: emitPosition.y)
            confettiBurst = true
        }
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = generateEmitterCell(color: UIColor.red)
        let green = generateEmitterCell(color: UIColor.green)
        let blue = generateEmitterCell(color: UIColor.blue)
        let yellow = generateEmitterCell(color: UIColor.yellow)
        particleEmitter.emitterCells = [red, green, blue, yellow]
        
        view.layer.addSublayer(particleEmitter)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            particleEmitter.removeFromSuperlayer()
        }
    }
    
    private class func generateEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        if confettiBurst{
            cell.birthRate = 7
            cell.lifetime = 4.0
            cell.emissionRange = CGFloat.pi * 2
        }
        else{
            cell.birthRate = 15
            cell.lifetime = 5.0
            cell.emissionRange = CGFloat.pi / 4
        }

        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 100
        cell.velocityRange = 5
        cell.emissionLongitude = CGFloat.pi
        cell.spin = 2
        cell.spinRange = 3
        cell.scale = 0.2
        cell.scaleRange = 0.25
        cell.scaleSpeed = -0.05
        
        cell.contents = UIImage(named: "singleConfetti")?.cgImage
        return cell
    }
}
