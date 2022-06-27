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
    
    
    
    
    @IBAction func buttonsTap(_ sender: UIButton) {
        checkLetter(sender)
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
