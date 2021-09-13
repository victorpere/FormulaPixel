//
//  ContactDelegate.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-12.
//

import SpriteKit

class ContactDelegate: NSObject, SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact impulse \(contact.collisionImpulse)")

    }
}
