//
//  ViewController.swift
//  Counter
//
//  Created by Angelina on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Creating variables for plus, minus and reset buttons
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButon: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // Variable counter
    private var counter: Int = 0
    
    // Creating variable for the history TextView and the counter Label
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    // Function for getting formatted date and time
    private func currentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "[dd/MM/yyyy HH:mm:ss]"
        return formatter.string(from: date)
    }
    
    // Function for hadling button action operations
    private func handleOperation(operation: String) {
        counterLabel.text = "Значение счетчика: \(counter)"
        editHistoryTextView(operation: operation)
    }
    
    //Function for edeting the history View field after pushing the buttons
    private func editHistoryTextView(operation: String) {
        let dateTime = currentTime()
        var actionPhrase: String = "" // Variable for dynamic action phrase
        switch operation {
        case "plus":
            actionPhrase = "значение изменено на +1"
        case "minus":
            actionPhrase = "значение изменено на -1"
        case "reset":
            actionPhrase = "значение сброшено"
        case "set negative number":
            actionPhrase = "попытка уменьшить значение счётчика ниже 0"
        default:
            historyTextView.text = "Произошла ошибка"
        }
        historyTextView.text = historyTextView.text + "\n" + dateTime + " : " + actionPhrase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Putting the plusButton and the minusButton into a circle shape
        plusButton.layer.cornerRadius = 30
        minusButon.layer.cornerRadius = 30
        
        resetButton.layer.cornerRadius = 5
        historyTextView.layer.cornerRadius = 5
    }

    // Action for tapping on the plus Button
    @IBAction private func plusButtonTapped() {
        counter += 1
        handleOperation(operation: "plus")
    }
    
    // Action for tapping on the minus Button
    @IBAction private func minusButtonTapped() {
        counter -= 1
        if counter < 0 {
            counter = 0
            editHistoryTextView(operation: "set negative number")
            return
        }
        handleOperation(operation: "minus")
    }
    
    // Action for tapping on the reset Button
    @IBAction private func resetButtonTapped() {
        counter = 0
        handleOperation(operation: "reset")
    }

}

