//
//  StockKeyboardView.swift
//  StockCustomKeyboard
//
//  Created by 金融研發一部-薛宇振 on 2019/1/9.
//  Copyright © 2019 金融研發一部-薛宇振. All rights reserved.
//

import UIKit

// Delegate method for the stock keyboard view that will allow it to perform actions on whatever text entry you want to use it with.
protocol StockKeyboardViewDelegate: AnyObject {
    
    func doneBtnPressed()
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> String?
    
}

// Contains all of the logic for handling button taps and translating that info specifi actions on the text entry associated with it
public class StockKeyboardView: UIView {

    // Keyboard outlate
    @IBOutlet weak var keyboardControlView: UIView!
    @IBOutlet weak var nextKeyboardButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    

    weak var delegate: StockKeyboardViewDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setNextKeyboardVisible(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setNextKeyboardVisible(_ visible: Bool) {
        nextKeyboardButton.isHidden = !visible
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.doneBtnPressed()
        print("YA")
    }

    
}

// MARK: - Actions
extension StockKeyboardView {
    
    @IBAction func allNumsButtonPressed(_ sender: UIButton) {
        guard let pressedValue = sender.titleLabel?.text else {
            return
        }
        delegate?.insertCharacter(pressedValue)
    }
    

    
    @IBAction func deletePressed(_ sender: UIButton) {
        delegate?.deleteCharacterBeforeCursor()
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        
    }
}

