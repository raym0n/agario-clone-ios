//
//  Player.swift
//  agario
//
//  Created by Yunhan Li on 9/15/15.
//
//

import SpriteKit

class Player : SKNode {
    
    init(playerName name : String, parentNode parent : SKNode) {
        super.init()
        self.position = CGPoint(x: 0, y: 0)
        
        self.name = name
        
        var ball = Ball(ballName: self.name!)
        self.addChild(ball)
        
        //self.zPosition = GlobalConstants.ZPosition.ball
        
        parent.addChild(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func centerPosition() -> CGPoint{
        let count = CGFloat(self.children.count)
        var x = CGFloat(0)
        var y = CGFloat(0)
        for ball in self.children {
            x += ball.position.x / count
            y += ball.position.y / count
        }
        return CGPoint(x: x, y: y)
    }
    
    func move(pos : CGPoint) {
        for ball in self.children as! [Ball] {
            ball.moveTowardTarget(targetLocation: pos)
        }
    }
    
    func floating() {
        for ball in self.children as! [Ball] {
            ball.targetDirection = CGVector(dx:0, dy: 0)
        }
    }
    
    // Potentially used for AI and online player
    func refreshState() {
        for ball in self.children as! [Ball] {
            ball.refresh()
        }
    }
    
    func split() {
        for ball in self.children as! [Ball] {
            if self.children.count < 15 && ball.radius >= 25 {
                ball.split()
            }
        }
    }
}
