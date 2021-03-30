//
//  ConsoleEntryValidator.swift
//  AskerValidator
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


protocol AskerValidator {
    associatedtype Item
    
    func invalidItemMessage(_ string: String?) -> String?
    func newItemPromptMessage() -> String
    
    func validatedItem(forString string: String) -> Item
}

func askForValidatedItem<T, W: AskerValidator>
    (originalValue value: String, validator: W) -> T where W.Item == T {
    
    var validatedValue: String = value
        
    while true {
        guard let invalidMessage = validator.invalidItemMessage(validatedValue) else {
            break
        }
        
        PromptSettings.print(invalidMessage)
        PromptSettings.print(validator.newItemPromptMessage(), terminator: "")
        
        validatedValue = readStringOrEmpty()
    }
    
    return validator.validatedItem(forString: validatedValue)
}
