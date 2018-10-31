//
//  PlayingCardView.swift
//  drawing practice
//
//  Created by Pawel Misiak on 10/25/18.
//  Copyright © 2018 Pawel Misiak. All rights reserved.
//


import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var numberOfObjects: Int = 1{
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    @IBInspectable var color: UIColor = UIColor.cyan{
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    @IBInspectable var lineWidth: Float = 1.0{
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    /* Diamonds */
    
    func diamond(path: UIBezierPath) -> UIBezierPath {
        let leftCorner = CGPoint(x: bounds.midX - 10, y: bounds.midY)
        let rightCorner = CGPoint(x: bounds.midX + 10, y: bounds.midY)
        let topCorner = CGPoint(x: bounds.midX, y: bounds.midY - 20)
        let bottomCorner = CGPoint(x: bounds.midX, y: bounds.midY + 20)
        
        path.move(to: leftCorner)
        path.addLine(to: topCorner)
        path.addLine(to: rightCorner)
        path.addLine(to: bottomCorner)
        path.close()
        
        return path
    }
    func twoTriangles(path: UIBezierPath) -> UIBezierPath {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let leftCorner = CGPoint(x: bounds.midX - 20, y: bounds.midY)
        let topCornerFirst = CGPoint(x: bounds.midX - 10, y: bounds.midY - 20)
        let rightCorner = CGPoint(x: bounds.midX + 20, y: bounds.midY)
        let topCornerSecond = CGPoint(x: bounds.midX + 10, y: bounds.midY - 20)
        
        path.move(to: center)
        path.addLine(to: leftCorner)
        path.addLine(to: topCornerFirst)
        path.addLine(to: center)
        path.addLine(to: rightCorner)
        path.addLine(to: topCornerSecond)
        path.addLine(to: center)
    
        return path
    }
    
    func threeTriangles(path: UIBezierPath) -> UIBezierPath {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let leftCorner = CGPoint(x: bounds.midX - 30, y: bounds.midY)
        let topCornerFirst = CGPoint(x: bounds.midX - 20, y: bounds.midY - 20)
        let leftCornerMiddle = CGPoint(x: bounds.midX - 10, y: bounds.midY)
        let topCornerSecond = CGPoint(x: bounds.midX, y: bounds.midY - 20)
        let rightCornerMiddle = CGPoint(x: bounds.midX + 10, y: bounds.midY)
        let topCornerThird = CGPoint(x: bounds.midX + 20, y: bounds.midY - 20)
        let rightCorner = CGPoint(x: bounds.midX + 30, y: bounds.midY)
        
        path.move(to: center)
        path.addLine(to: leftCorner)
        path.addLine(to: topCornerFirst)
        path.addLine(to: leftCornerMiddle)
        path.addLine(to: topCornerSecond)
        path.addLine(to: rightCornerMiddle)
        path.addLine(to: topCornerThird)
        path.addLine(to: rightCorner)
        path.addLine(to: center)
        
        return path
    }
    
    /* Ovals */
    
    func oval(path: UIBezierPath) -> UIBezierPath {
        let leftMiddle = CGPoint(x: bounds.midX - 10, y: bounds.midY)
        let leftTop = CGPoint(x: bounds.midX - 10, y: bounds.midY - 10)
        let centerTop1 = CGPoint(x: bounds.midX - 10, y: bounds.midY - 30)
        let centerTop2 = CGPoint(x: bounds.midX + 10, y: bounds.midY - 30)
        let RightTop = CGPoint(x: bounds.midX + 10, y: bounds.midY - 10)
        let RightBottom = CGPoint(x: bounds.midX + 10, y: bounds.midY + 10)
        let centerBottom1 = CGPoint(x: bounds.midX - 10, y: bounds.midY + 30)
        let centerBottom2 = CGPoint(x: bounds.midX + 10, y: bounds.midY + 30)
        let LeftBottom = CGPoint(x: bounds.midX - 10, y: bounds.midY + 10)
        
        path.move(to: leftMiddle)
        path.addLine(to: leftTop)
        path.addCurve(to: RightTop, controlPoint1: centerTop1, controlPoint2: centerTop2)
        path.addLine(to: RightBottom)
        path.addCurve(to: LeftBottom, controlPoint1: centerBottom2, controlPoint2: centerBottom1)
        path.close()
        
        return path
    }
    
    /* Squigle */
    
    func squigle(path: UIBezierPath) -> UIBezierPath {
        let leftTop = CGPoint(x: bounds.midX - 10, y: bounds.midY - 10)
        let rightTop = CGPoint(x: bounds.midX + 10, y: bounds.midY - 10)
        let leftMiddle = CGPoint(x: bounds.midX - 10, y: bounds.midY)
        let rightMiddle = CGPoint(x: bounds.midX + 10, y: bounds.midY)
        let rightBottom = CGPoint(x: bounds.midX + 10, y: bounds.midY + 10)
        let leftBottom = CGPoint(x: bounds.midX - 10, y: bounds.midY + 10)
        
        let ctrLT1 = CGPoint(x: bounds.midX - 20, y: bounds.midY - 3)
        let ctrLT2 = CGPoint(x: bounds.midX - 20, y: bounds.midY - 7)

        let ctrLTR1 = CGPoint(x: bounds.midX - 0, y: bounds.midY - 7)
        let ctrLTR2 = CGPoint(x: bounds.midX - 0, y: bounds.midY - 3)
        
        let ctrRBR1 = CGPoint(x: bounds.midX + 20, y: bounds.midY + 3)
        let ctrRBR2 = CGPoint(x: bounds.midX + 20, y: bounds.midY + 7)
        
        let ctrRBL1 = CGPoint(x: bounds.midX, y: bounds.midY + 7)
        let ctrRBL2 = CGPoint(x: bounds.midX, y: bounds.midY + 3)
        
        path.move(to: leftMiddle)
        path.addCurve(to: leftTop, controlPoint1: ctrLT1, controlPoint2: ctrLT2)
        path.addLine(to: rightTop)
        path.addCurve(to: rightMiddle, controlPoint1: ctrLTR1, controlPoint2: ctrLTR2)
        path.addCurve(to: rightBottom, controlPoint1: ctrRBR1, controlPoint2: ctrRBR2)
        path.addLine(to: leftBottom)
        path.addCurve(to: leftMiddle, controlPoint1: ctrRBL1, controlPoint2: ctrRBL2)
//        path.close()
        
        return path
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let path_1 = squigle(path: path)

        path.append(path_1)
        color.setFill()
        path.lineWidth = CGFloat(lineWidth)
        path.stroke()
        path.fill()
    }
    //backup copy
//    override func draw(_ rect: CGRect) {
//        var path = UIBezierPath()
//        switch numberOfObjects {
//        case 1: path = oneTriangle(path: path)
//        case 2: path = twoTriangles(path: path)
//        case 3: path = threeTriangles(path: path)
//        default:
//            break
//        }
//        var path_1 = UIBezierPath()
//        path_1 = path.apply(CGAffineTransform(translationX: -10, y: 0))
//        path.append(path_1)
//        color.setFill()
//        path.lineWidth = CGFloat(lineWidth)
//        path.stroke()
//        path.fill()
//    }
}
