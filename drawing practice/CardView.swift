//
//  PlayingCardView.swift
//  drawing practice
//
//  Created by Pawel Misiak on 10/25/18.
//  Copyright © 2018 Pawel Misiak. All rights reserved.
//
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//        path.lineWidth = 5.0
//        UIColor.cyan.setFill()
//        UIColor.magenta.setStroke()
//        path.stroke()
//        path.fill()
//    }

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
    
    /* TRIANGLES */
    
    func oneTriangle(path: UIBezierPath) -> UIBezierPath {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let leftCorner = CGPoint(x: bounds.midX - 10, y: bounds.midY)
        let rightCorner = CGPoint(x: bounds.midX + 10, y: bounds.midY)
        let topCorner = CGPoint(x: bounds.midX, y: bounds.midY - 20)
        
        path.move(to: center)
        path.addLine(to: leftCorner)
        path.addLine(to: topCorner)
        path.addLine(to: rightCorner)
        path.addLine(to: center)
        
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
    
    func oneOval(path: UIBezierPath) -> UIBezierPath {
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
    
//    func methodChooser(num: Int, color: UIColor) -> UIBezierPath {
//        switch num {
//        case 1: return oneTriangle(path: path)
//        case 2: return twoTriangles(path: path)
//        case 3: return threeTriangles(path: path)
//        default:
//            return oneTriangle(path: path)
//        }
//    }
    
//    var path = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let path_1 = oneTriangle(path: path)
        let path_2 = oneTriangle(path: path)
        
        path_1.apply(CGAffineTransform(translationX: -20, y: 0))
        path_2.apply(CGAffineTransform(translationX: +20, y: 0))
        path.append(path_1)
        path.append(path_2)
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
