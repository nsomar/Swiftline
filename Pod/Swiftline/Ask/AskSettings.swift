//
//  AskSettings.swift
//  AskSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/// Settings used to costumize the behaviour of ask()
public class AskSettings<T: ArgConvertibleType> {
    
    /// Default value to set incase the user entered a blank
    public var defaultValue: T?
    
    /// If set to true, another message will follow successful user entry asking the user to confirm
    /// his selection
    public var confirm = false
    
    var invalidClousures: [(T -> Bool, String)] = []
    
    
    /**
     Add an invalid entry case
     
     - parameter description:   The string to be printed to the stdout if the case is invalid
     - parameter invalidIfTrue: If true is returned, then the user input was invalid, if false, the 
                                user input was valid.
     */
    public func addInvalidCase(description: String, invalidIfTrue: (T -> Bool)) {
        invalidClousures.append(invalidIfTrue, description)
    }
    
    func preparedItem(originalString string: String) -> T {
        if string.isEmpty && defaultValue != nil {
            return defaultValue!
        }
        
        return T.fromString(string)!
    }
}


// MARK:- Internal extension

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