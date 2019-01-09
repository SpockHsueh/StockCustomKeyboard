//
//  MainViewController.swift
//  StockCustomKeyboard
//
//  Created by 金融研發一部-薛宇振 on 2019/1/9.
//  Copyright © 2019 金融研發一部-薛宇振. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController {
    
    @IBOutlet weak var unitTxtField: UITextField!
    @IBOutlet weak var priceTxtField: UITextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Add an observer so that we can adjust the UI when the keyboard is showing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Add observer to know when app comes to foreground to update UI
        NotificationCenter.default.addObserver(self, selector: #selector(reloadView), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        
        // Add KVO for textfield to determine when cursor moves
        unitTxtField.addObserver(self, forKeyPath: "selectedUnitTextRange", options: .new, context: nil)
        priceTxtField.addObserver(self, forKeyPath: "selectedPriceTextRange", options: .new, context: nil)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    

    
    deinit {
        NotificationCenter.default.removeObserver(self)
        unitTxtField.removeObserver(self, forKeyPath: "selectedUnitTextRange")
        priceTxtField.removeObserver(self, forKeyPath: "selectedPriceTextRange")
    }

}

// MARK: - Observers
extension MainViewController {
    
    @objc func reloadView() {
        // start the app with the keyboard showing
        unitTxtField.becomeFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            // MARK: - TODO 拿到 keyboard height, 做後續設定...
            let keyboardHeight = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height,
            // MARK: - TODO 拿到 keyboard animation, 做後續設定...
            let animationDurarion = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval) else {
                return
        }
        
        UIView.animate(withDuration: animationDurarion) {
            self.view.layoutIfNeeded()
        }
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "selectedUnitTextRange" {
            // Clear out the current signal as the cursor placement changed
            
        } else if keyPath == "selectedPriceTextRange" {
            // Clear out the current signal as the cursor placement changed
        }
    }
}
