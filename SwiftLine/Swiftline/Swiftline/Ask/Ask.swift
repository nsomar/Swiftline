//
//  Asker.swift
//  Ask
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/**
 Display a promt to the user
 
 - parameter prompt:   The message to display
 - parameter customizationBlock: The block to costumize the prompt before displaying
 
 - returns: The string enters from the user
 */
public func ask(prompt: String, customizationBlock: (AskSettings<String> -> Void)? = nil) -> String {
    return ask(prompt, type: String.self, customizationBlock: customizationBlock)
}


/**
  Display a promt to the user

 - parameter prompt:The message to display
 - parameter type: The value type to be expected from the user
 - parameter customizationBlock: The block to costumize the prompt before displaying
 
 - returns: The string casted to the type requested
 - discussion: If the user enters a wrong type, ask will keep prompting until a correct value has been entered
 */
public func ask<T: ArgConvertibleType>(prompt: String, type: T.Type, customizationBlock: (AskSettings<T> -> Void)? = nil) -> T {
    
    PromptSettings.print(prompt)
    
    let settings = getSettings(customizationBlock)
    
    if settings.confirm {
        return getValidatedStringWithConfirmation(settings)
    } else {
        return getValidatedString(settings)
    }
}


// MARK:- Internal functions


func getValidatedString<T: ArgConvertibleType, W: AskerValidator where W.Item == T>(validator: W) -> T {
    let stringOrEmpty = readStringOrEmpty()
    return askForValidatedItem(originalValue: stringOrEmpty, validator: validator)
}


func getValidatedStringWithConfirmation<T: ArgConvertibleType, W: AskerValidator where W.Item == T>(validator: W) -> T {
    
    while true {
        let stringOrEmpty = readStringOrEmpty()
        let answer = askForValidatedItem(originalValue: stringOrEmpty, validator: validator)
        
        if agree("Are you sure?") {
            return answer
        } else {
            PromptSettings.print("?  ", terminator: "")
        }
    }
}


func getSettings<T>(callback: (AskSettings<T> -> Void)?) -> AskSettings<T> {
    let settings = AskSettings<T>()
    callback?(settings)
    return settings
}


func readStringOrEmpty() -> String {
    return PromptSettings.read() ?? ""
}
