//
//  Agree.swift
//  Agree
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation

/**
 Displays a yes/no prompt to the user
 
 - parameter prompt: The prompt to display
 - returns: the user decision
 */
public func agree(prompt: String) -> Bool {
    PromptSettings.print(prompt, terminator: "  ")
    let value = readStringOrEmpty()
    
    let settings = AgreeSettings(prompt: prompt)
    let validatedValue = askForValidatedItem(originalValue: value, validator: settings)
    
    return settings.isPositive(validatedValue)
}