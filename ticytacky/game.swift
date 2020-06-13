//
//  game.swift
//  ticytacky
//
//  Created by Callum Smith on 10/06/2020.
//  Copyright © 2020 Callum Smith. All rights reserved.
//

import UIKit

class game: UIViewController {

    @IBOutlet weak var oneOutlet: UIButton!
    @IBOutlet weak var twoOutlet: UIButton!
    @IBOutlet weak var threeOutlet: UIButton!
    @IBOutlet weak var fourOutlet: UIButton!
    @IBOutlet weak var fiveOutlet: UIButton!
    @IBOutlet weak var sixOutlet: UIButton!
    @IBOutlet weak var sevenOutlet: UIButton!
    @IBOutlet weak var eightOutlet: UIButton!
    @IBOutlet weak var nineOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    @IBOutlet weak var backOutlet: UIButton!
    
    let ticTac = Tictac()
    var turn = 0
    var active = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOutlet.layer.cornerRadius = 15
        backOutlet.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    func turnEnd(){
        if(ticTac.isEnd() != -1){
            active = false
        }
    }
    
    @objc func compTurn(){
        if(active){
            switch ticTac.compsTurn(){
            case [0,0]:
                oneOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [0,1]:
                twoOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [0,2]:
                threeOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [1,0]:
                fourOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [1,1]:
                fiveOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [1,2]:
                sixOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [2,0]:
                sevenOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [2,1]:
                eightOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            case [2,2]:
                nineOutlet.setImage(UIImage(named: "cross.png"), for: .normal)
            default:
                break
            }
            turnEnd()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        ticTac.reset()
        active = true
        oneOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        twoOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        threeOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        fourOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        fiveOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        sixOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        sevenOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        eightOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
        nineOutlet.setImage(UIImage(named: "empty.png"), for: .normal)
    }
    
    @IBAction func one(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 0, y: 0)){
            oneOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func two(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 0, y: 1)){
            twoOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func three(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 0, y: 2)){
            threeOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func four(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 1, y: 0)){
            fourOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func five(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 1, y: 1)){
            fiveOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func six(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 1, y: 2)){
            sixOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func seven(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 2, y: 0)){
            sevenOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func eight(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 2, y: 1)){
            eightOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
    @IBAction func nine(_ sender: Any) {
        if(active && ticTac.turnTaken(x: 2, y: 2)){
            nineOutlet.setImage(UIImage(named: "naught.png"), for: .normal)
            turnEnd()
            perform(#selector(compTurn), with: nil, afterDelay: 0.8)
        }
    }
}
