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
    }
    
    

}



//class KeyboardViewController: UIInputViewController {
//
//    @IBOutlet var nextKeyboardButton: UIButton!
//
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//
//        // Add custom view sizing constraints here
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//
//        self.view.addSubview(self.nextKeyboardButton)
//
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//    }
//
//    override func textWillChange(_ textInput: UITextInput?) {
//        // The app is about to change the document's contents. Perform any preparation here.
//    }
//
//    override func textDidChange(_ textInput: UITextInput?) {
//        // The app has just changed the document's contents, the document context has been updated.
//
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
//    }
//
//}
