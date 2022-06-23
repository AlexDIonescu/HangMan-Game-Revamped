//
//  ViewController.swift
//  HangMan
//
//  Created by Alex Ionescu on 08.05.2022.
//

import UIKit

var word : String = ""
var hint : String = ""

class ViewController: UIViewController , UITextFieldDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordInput.delegate = self
        guessButton.isEnabled = false
        
    }
    
    
    @IBAction func tapGestureRecognize(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == wordInput {
            addButtonTap(addButton)
        }
        return true
    }
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var viewWordButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func wordInputType(_ sender: UITextField) {
    }
    @IBAction func addButtonTap(_ sender: UIButton) {
        if addButton.titleLabel?.text == "Add word" {
            if wordInput.text != "" {
                
                word = (wordInput.text?.uppercased())!
                word.removeLast()
                wordLabel.backgroundColor = .orange
                wordInput.text = ""
                wordLabel.text = ""
                wordInput.resignFirstResponder()
                viewWordButton.backgroundColor = .systemMint
                guessButton.isEnabled = true
                addButton.setTitle("Add hint", for: .normal)
            } else {
                wordLabel.backgroundColor = .orange
                wordLabel.text = "Your word can't be null!"
                wordInput.resignFirstResponder()
            }
        } else if addButton.titleLabel?.text == "Add hint" {
            if wordInput.text != "" {
               hint = (wordInput.text?.uppercased())!
               addButton.isEnabled = false
               wordLabel.text = ""
            } else {
                wordLabel.backgroundColor = .orange
                wordLabel.text = "Your hint is not valid!!"
                wordInput.resignFirstResponder()
            }
            wordInput.text = ""
        }
    }
    @IBAction func viewWordButtonTap(_ sender: UIButton) {
        if wordLabel.text == "" || guessButton.isEnabled == false {
           wordLabel.text = "Your word is: \n\n▶︎ \(word) ◀︎"
        } else {
           wordLabel.text = ""
        }
    }

    @IBAction func guessButtonTap(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.wordLabel.text = "Don't forget to press reset if you want to play again!!"
        }
    }
    
    @IBAction func resetButtonTap(_ sender: UIButton) {
        word = ""
        hint = ""
        addButton.setTitle("Add word", for: .normal)
        wordLabel.text = ""
        addButton.isEnabled = true
        guessButton.isEnabled = false
    }
    
}

