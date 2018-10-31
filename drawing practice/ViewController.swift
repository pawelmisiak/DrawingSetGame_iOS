//
//  ViewController.swift
//  drawing practice
//
//  Created by Pawel Misiak on 10/25/18.
//  Copyright © 2018 Pawel Misiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Set()
    
    
    
    @IBOutlet weak var CardView: CardView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(nextCard))
            CardView.addGestureRecognizer(tap)
        }
    }
    
    @objc private func nextCard() {
        let card = game.cards.remove(at: 0)
        print(card)
        CardView.numberOfObjects = card.symbolCount
        switch card.color {
        case "red": CardView.color = UIColor.red
        case "green": CardView.color = UIColor.green
        case "blue": CardView.color = UIColor.blue
        default: break
        }
        CardView.lineWidth = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

