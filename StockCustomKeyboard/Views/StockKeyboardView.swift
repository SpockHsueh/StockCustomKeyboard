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
class StockKeyboardView: UIView {



}
