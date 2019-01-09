//
//  KeyboardViewController.swift
//  StockKeyboard
//
//  Created by 金融研發一部-薛宇振 on 2019/1/9.
//  Copyright © 2019 金融研發一部-薛宇振. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    // a property to hold reference to a StockKeyboardView object
    var stockKeyboardView: StockKeyboardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // an instance of StockKeyboardView is added to the controller's root inputView
        let nib = UINib(nibName: "StockKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        stockKeyboardView = objects.first as! StockKeyboardView
        stockKeyboardView.delegate = self

        // UIInputViewController 裡的 property
        guard let inputView = inputView else { return }
        inputView.addSubview(stockKeyboardView)
        
        // constraints pinning StockKeyboardView to the superView are added and activated
        stockKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stockKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            stockKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            stockKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            stockKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
            ])
        
        // handleInputModeList will automatically handle switching
        stockKeyboardView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }

}

extension KeyboardViewController: StockKeyboardViewDelegate {
    
    func doneBtnPressed() {
    }
    
    // a custom keyboard extension doesn’t have direct access to the text input view. What you do have access to is a property of type of UITextDocumentProxy.
    func insertCharacter(_ newCharacter: String) {
        textDocumentProxy.insertText(newCharacter)
    }
    
    func deleteCharacterBeforeCursor() {
        textDocumentProxy.deleteBackward()
    }
    
    func characterBeforeCursor() -> String? {
        guard let character = textDocumentProxy.documentContextBeforeInput?.last else {
            return nil
        }
        return String(character)
    }
    
    
}
