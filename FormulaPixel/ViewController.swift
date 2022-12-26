//
//  ViewController.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-01.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var skView: SKView!
    
    private var configured = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .black
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if self.configured {
            return
        }
        
        self.configured = true
        
        let safeFrame = CGRect(x: self.view.safeAreaInsets.left,
                                y: self.view.safeAreaInsets.top,
                                width: self.view.frame.width - self.view.safeAreaInsets.left - self.view.safeAreaInsets.right,
                                height: self.view.frame.height - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom)
        self.skView = SKView(frame: safeFrame)
        self.skView.isMultipleTouchEnabled = true
        self.view.addSubview(self.skView)
        
        self.start()
    }
    
    fileprivate func start() {
        let trackScene = TrackScene(size: self.skView.frame.size)
        
        self.skView.presentScene(trackScene)
    }
}

