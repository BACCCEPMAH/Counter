//
//  ViewController.swift
//  Counter
//
//  Created by Матвей Кашин on 12.11.2023.
//


// Приветствую! Скажи пожалуйста насколько строго требуется соблюдать ТЗ? Можно ли в разумных пределах отступать от него? Изначально у меня весь интерфейс был написан на английском языке, но в последний момент решил всё таки строго соблюсти ТЗ. Можно ли в будущих заданиях писать приложения с интерфейсом на английском?


import UIKit
import Foundation

class ViewController: UIViewController {
    
    var numberOnCounter = 0 {
        didSet {
            if numberOnCounter < 0 {
                numberOnCounter = 0
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        numberOnCounter = 0
        updateLabel()
        updateTextView(textToUpdate: "Значение сброшено")
    }
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func plusButton(_ sender: UIButton) {
        numberOnCounter += 1
        updateLabel()
        updateTextView(textToUpdate: "значение изменено на +1")
    }
    @IBAction func minusButton(_ sender: Any) {
        
        if numberOnCounter > 0 {
            numberOnCounter -= 1
            updateLabel()
            updateTextView(textToUpdate: "значение изменено на -1")
        } else {
            updateTextView(textToUpdate: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        textView.text = "История изменений:"
    }
    
    func updateLabel(){
        counterLabel.text = "\(numberOnCounter)"
    }
    
    func updateTextView(textToUpdate: String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        let formattedDate = dateFormatter.string(from: Date())
        
        textView.text = "История изменений: \n \(formattedDate) \(textToUpdate)"
    }
    


}

