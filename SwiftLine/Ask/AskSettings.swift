//
//  AskSettings.swift
//  AskSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


class AskSettings<T: ArgConvertibleType> {
    var defaultValue: T?
    
    var invalidClousures: [(T -> Bool, String)] = []
    var confirm = false
    
    func addInvalidCase(description: String, invalidIfTrue: (T -> Bool)) {
        invalidClousures.append(invalidIfTrue, description)
    }
    
    func preparedItem(originalString string: String) -> T {
        if string.isEmpty && defaultValue != nil {
            return defaultValue!
        }
        
        return T.fromString(string)!
    }
}

extension AskSettings: AskerValidator {
    func invalidItemMessage(string: String?) -> String? {
        guard let string = string else {
            return "You provided an empty message, pelase enter anything!"
        }
        
        guard let validatedItem = T.fromString(string) else {
            return "You must enter a valid \(T.typeName())."
        }
        
        guard let validationError = firstValidationError(validatedItem) else {
            return nil
        }
        
        return validationError
    }
    
    func newItemPromptMessage() -> String {
        return "?  "
    }
    
    func validatedItem(forString string: String) -> T {
        return T.fromString(string)!
    }
    
    func firstValidationError(item: T) -> String? {
        
        for (isInvalid, validationError) in invalidClousures {
            if isInvalid(item) {
                return validationError
            }
        }
        
        return nil
    }
}