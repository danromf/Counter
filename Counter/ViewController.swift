//
//  ViewController.swift
//  Counter
//
//  Created by Даниил Романов on 01.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var counterLabel: UILabel!
    
    private var counter = 0 {
        didSet {
            counterLabel.text = String(counter)
        }
    }
    
    private var historyMessage = "История изменений:\n" {
        didSet {
            historyTextView.text = historyMessage
            let range = NSRange(location: historyTextView.text.count - 1, length: 0)
            historyTextView.scrollRangeToVisible(range)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = historyMessage
    }
    
    private func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        return formatter.string(from: Date())
    }
    
    @IBAction private func increaseCounter(_ sender: UIButton) {
        counter += 1
        
        historyMessage += "\(getCurrentDateTime()): значение изменено на +1\n"
    }
    
    @IBAction private func decreaseCounter(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            historyMessage += "\(getCurrentDateTime()): значение изменено на -1\n"
        }
        else {
            historyMessage += "\(getCurrentDateTime()): попытка уменьшить значение счетчика ниже 0\n"
        }
    }
    
    @IBAction private func resetCounter(_ sender: UIButton) {
        counter = 0
        historyMessage += "\(getCurrentDateTime()): значение сброшено\n"
    }
    
    @IBAction private func increaseButtonTouchDown(_ sender: UIButton) {
        sender.tintColor = UIColor(red: 0.06, green: 0.38, blue: 0.14, alpha: 1.00)
    }
    
    @IBAction private func increaseButtonTouchUp(_ sender: UIButton) {
        sender.tintColor = .systemGreen
    }
    
    @IBAction private func decreaseButtonTouchDown(_ sender: UIButton) {
        sender.tintColor = .darkGray
    }
    
    @IBAction private func decreaseButtonTouchUp(_ sender: UIButton) {
        sender.tintColor = .lightGray
    }
    
}

