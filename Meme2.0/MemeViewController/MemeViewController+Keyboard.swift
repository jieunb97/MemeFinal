//
//  MemeViewController+Keyboard.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import Foundation
import UIKit

extension MemeViewController: UITextFieldDelegate {

    struct TextConstants {
        static let memeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            .strokeWidth: -4.0
        ]
    }

    func setupTextFieldInitialProperties(toTextField textField: UITextField) {
        textField.defaultTextAttributes = TextConstants.memeTextAttributes
        textField.textAlignment = NSTextAlignment.center
        textField.delegate = self
    }
        
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if (textBottom.isEditing) {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }

    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
        
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
