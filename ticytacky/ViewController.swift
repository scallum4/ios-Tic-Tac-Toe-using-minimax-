//
//  ViewController.swift
//  ticytacky
//
//  Created by Callum Smith on 10/06/2020.
//  Copyright © 2020 Callum Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        play.layer.cornerRadius = 15
    }
    @IBAction func playPressed(_ sender: Any) {
    }
    

}

