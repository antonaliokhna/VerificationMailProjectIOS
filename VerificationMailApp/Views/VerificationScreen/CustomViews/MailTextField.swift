//
//  MailTextField.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class MailTextField: UITextField {
    
    weak var actionsDelegate: TextFieldActionsDelegateType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegate() {
        delegate = self
    }
    
    private func configurate() {
        font = .systemFont(ofSize: 20)
        backgroundColor = .white
        placeholder = "Email adress"
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        borderStyle = .none
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        autocapitalizationType = .none
        autocorrectionType = .no
    }
    
    func setTitle(value: String) {
        text = value
        actionsDelegate?.textFieldChange(mailAdress: value)
    }
}

//MARK: - UITextFieldDelegate

extension MailTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        actionsDelegate?.textFieldClear()
        
        return true
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            actionsDelegate?.textFieldChange(mailAdress: updatedText)
        }
        
        return true
    }
}
