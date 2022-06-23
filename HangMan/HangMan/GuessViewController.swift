//
//  GuessViewController.swift
//  HangMan
//
//  Created by Alex Ionescu on 01.06.2022.
//

import UIKit


class GuessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerArrowLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        if word != "" {
           for _ in 0..<word.count {
              guessedWordLabel.text! += "➖"
           }
        }
        livesLabel.text = "💚💚💚💚💚💚"
        if hint == "" {
            hintLabel.text = "No hint! You're too smart!"
        } else {
            hintLabel.text = "Hint: \(hint)"
        }
    }
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var headerArrowLabel: UILabel!
    
    @IBOutlet weak var guessedWordLabel: UILabel!
    
    @IBOutlet weak var livesLabel: UILabel!
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet var aButton: UIButton!
    @IBOutlet var bButton: UIButton!
    @IBOutlet var cButton: UIButton!
    @IBOutlet var dButton: UIButton!
    @IBOutlet var eButton: UIButton!
    @IBOutlet var fButton: UIButton!
    @IBOutlet var gButton: UIButton!
    @IBOutlet var hButton: UIButton!
    @IBOutlet var iButton: UIButton!
    @IBOutlet var jButton: UIButton!
    @IBOutlet var kButton: UIButton!
    @IBOutlet var lButton: UIButton!
    @IBOutlet var mButton: UIButton!
    @IBOutlet var nButton: UIButton!
    @IBOutlet var oButton: UIButton!
    @IBOutlet var pButton: UIButton!
    @IBOutlet var qButton: UIButton!
    @IBOutlet var rButton: UIButton!
    @IBOutlet var sButton: UIButton!
    @IBOutlet var tButton: UIButton!
    @IBOutlet var uButton: UIButton!
    @IBOutlet var vButton: UIButton!
    @IBOutlet var wButton: UIButton!
    @IBOutlet var xButton: UIButton!
    @IBOutlet var yButton: UIButton!
    @IBOutlet var zButton: UIButton!
    
    @IBAction func aButtonTap(_ sender: UIButton) {
        checkLetter(aButton)
    }
    @IBAction func bButtonTap(_ sender: UIButton) {
        checkLetter(bButton)
    }
    @IBAction func cButtonTap(_ sender: UIButton) {
        checkLetter(cButton)
    }
    @IBAction func dButtonTap(_ sender: UIButton) {
        checkLetter(dButton)
    }
    @IBAction func eButtonTap(_ sender: UIButton) {
        checkLetter(eButton)
    }
    @IBAction func fButtonTap(_ sender: UIButton) {
        checkLetter(fButton)
    }
    @IBAction func gButtonTap(_ sender: UIButton) {
        checkLetter(gButton)
    }
    @IBAction func hButtonTap(_ sender: UIButton) {
        checkLetter(hButton)
    }
    @IBAction func iButtonTap(_ sender: UIButton) {
        checkLetter(iButton)
    }
    @IBAction func jButtonTap(_ sender: UIButton) {
        checkLetter(jButton)
    }
    @IBAction func kButtonTap(_ sender: UIButton) {
        checkLetter(kButton)
    }
    @IBAction func lButtonTap(_ sender: UIButton) {
        checkLetter(lButton)
    }
    @IBAction func mButtonTap(_ sender: UIButton) {
        checkLetter(mButton)
    }
    @IBAction func nButtonTap(_ sender: UIButton) {
        checkLetter(nButton)
    }
    @IBAction func oButtonTap(_ sender: UIButton) {
        checkLetter(oButton)
    }
    @IBAction func pButtonTap(_ sender: UIButton) {
        checkLetter(pButton)
    }
    @IBAction func qButtonTap(_ sender: UIButton) {
        checkLetter(qButton)
    }
    @IBAction func rButtonTap(_ sender: UIButton) {
        checkLetter(rButton)
    }
    @IBAction func sButtonTap(_ sender: UIButton) {
        checkLetter(sButton)
    }
    @IBAction func tButtonTap(_ sender: UIButton) {
        checkLetter(tButton)
    }
    @IBAction func uButtonTap(_ sender: UIButton) {
        checkLetter(uButton)
    }
    @IBAction func vButtonTap(_ sender: UIButton) {
        checkLetter(vButton)
    }
    @IBAction func wButtonTap(_ sender: UIButton) {
        checkLetter(wButton)
    }
    @IBAction func xButtonTap(_ sender: UIButton) {
        checkLetter(xButton)
    }
    @IBAction func yButtonTap(_ sender: UIButton) {
        checkLetter(yButton)
    }
    @IBAction func zButtonTap(_ sender: UIButton) {
        checkLetter(zButton)
    }
    
    func checkLetter(_ sender: UIButton) {
        let letter : Character = (sender.titleLabel?.text?.first)!
        let auxWord = [Character](word)
        var guessedWordAux = [Character](guessedWordLabel.text!)
        if word.contains((sender.titleLabel?.text)!) {
            for i in 0..<auxWord.count {
                if(auxWord[i] == letter){
                    guessedWordAux[i] = letter
                }
            }
            guessedWordLabel.text = String(guessedWordAux)
            
            if guessedWordLabel.text! == word {
                let alert = UIAlertController(title: "You win!!", message: "You are a master of words!!", preferredStyle: .alert)
                let alertAction = (UIAlertAction(title: "Return to main menu", style: .default, handler: {_ in
                    
                    self.dismiss(animated: true)
                    
                }))
                alert.addAction(alertAction)
                self.present(alert, animated: true)
            }
        } else {
            livesLabel.text?.removeLast()
        }
        if livesLabel.text!.count == 0 {
            let alert = UIAlertController(title: "You lose!!", message: "You have no remaining lives!", preferredStyle: .alert)
            let alertAction = (UIAlertAction(title: "Return to main menu", style: .default, handler: {_ in
                
                self.dismiss(animated: true)
                
            }))
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            
}
        sender.isEnabled = false
}
   
}
