//
//  Asker.swift
//  Ask
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


func ask(prompt: String, callback: (AskSettings<String> -> Void)? = nil) -> String {
    return ask(prompt, type: String.self, callback: callback)
}

func ask<T: ArgConvertibleType>(prompt: String, type: T.Type, callback: (AskSettings<T> -> Void)? = nil) -> T {
    
    PromptSettings.print(prompt)
    
    
    let settings = getSettings(callback)
    
    if settings.confirm {
        return getValidatedStringWithConfirmation(settings)
    } else {
        return getValidatedString(settings)
    }
}

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
