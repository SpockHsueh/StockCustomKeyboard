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
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> String?
}

// Contains all of the logic for handling button taps and translating that info specifi actions on the text entry associated with it
public class StockKeyboardView: UIView {

    @IBOutlet weak var keyboardControlView: UIView!
    @IBOutlet weak var nextKeyboardButton: UIButton!
    private var allTextButtons = [UIButton]()
    
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
    
    private func setupButton() {
        let nums = ["1","2","3","4","5","6","7","8","9",".","0","00"]
        
        let numsRow = addValuesOnKeyboard(kbKeys: nums)
    }
    
    
    // Adding keys on UiView with UiStack view
    private func addValuesOnKeyboard(kbKeys: [String]) -> UIView {
        
        let rowStackView = UIStackView.init()
        rowStackView.spacing = 5
        rowStackView.axis = .horizontal
        rowStackView.alignment = .fill
        rowStackView.distribution = .fillEqually
        
        for key in kbKeys {
            rowStackView.addArrangedSubview(createButtonWithTitle(title: key))
        }
        
        let keysView = UIView()
        keysView.backgroundColor = .red
        keysView.addSubview(rowStackView)
        keysView.
        
    }
    
    private func createButtonWithTitle(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        allTextButtons.append(button)
        return button
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        
    }
    
    
}

// MARK: - Actions
extension StockKeyboardView {
    
}
