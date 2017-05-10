//
//  GenericViewController.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import PKHUD

class GenericViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showHUD(){
        
        HUD.show(.progress)
    }
    
    func hideHUD(){
        
        HUD.hide(animated: true)
    }
    
}
