//
//  ConsoleEntryValidator.swift
//  AskerValidator
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol AskerValidator {
    typealias Item
    
    func invalidItemMessage(string: String?) -> String?
    func newItemPromptMessage() -> String
    
    func validatedItem(forString string: String) -> Item
}

func askForValidatedItem<T, W: AskerValidator where W.Item == T>
    (originalValue value: String, validator: W) -> T {
    
    var validatedValue: String? = value
        
    while true {
        guard let invalidMessage = validator.invalidItemMessage(validatedValue) else {
            break
        }
        
        PromptSettings.print(invalidMessage)
        PromptSettings.print(validator.newItemPromptMessage(), terminator: "")
        
        validatedValue = readStringOrEmpty()
    }
    
    return validator.validatedItem(forString: validatedValue!)
}
