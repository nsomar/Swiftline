//
//  Chooser.swift
//  Choose
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


import Foundation


/**
 Presents a user with a menu of items to choose from
 
 - parameter prompt:  The menu prompt message
 - parameter choices: List of choices
 
 - returns: The user selected item
 */
public func choose(prompt: String, choices: String...) -> String {
    return choose(prompt, type: String.self) {
        for choice in choices {
            $0.addChoice(choice) { return choice }
        }
    }
}


/**
 Presents a user with a menu of items to choose from
 
 - parameter costumizationBlock: Closure to be called with a ChooseSettings, changes to the settings are reflected to the prompt
 
 - returns: The user selected item
 */
public func choose<T>(costumizationBlock: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(costumizationBlock)
    return choose(settings, type: T.self)
}


/**
 Presents a user with a menu of items to choose from
 
 - parameter prompt:             The menu prompt message
 - parameter type:               The value type to be expected from the user
 - parameter costumizationBlock: Closure to be called with a ChooseSettings, changes to the settings are reflected to the prompt
 
 - returns: The user selected item
 */
public func choose<T>(prompt: String, type: T.Type, costumizationBlock: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(costumizationBlock)
    settings.promptQuestion = prompt
    return choose(settings, type: type)
}


/**
 Presents a user with a menu of items to choose from
 
 - parameter type:               The value type to be expected from the user
 - parameter costumizationBlock: Closure to be called with a ChooseSettings, changes to the settings are reflected to the prompt
 
 - returns: The user selected item
 */
public func choose<T>(type: T.Type, costumizationBlock: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(costumizationBlock)
    return choose(settings, type: type)
}


// MARK :- Internal functions


func choose<T>(settings: ChooseSettings<T>, type: T.Type) -> T {
    
    let items = settings.preparePromptItems()
    
    items.forEach { PromptSettings.print($0) }
    PromptSettings.print("\(settings.promptQuestion)", terminator: "")
    
    let stringRead = readStringOrEmpty()
    
    return askForValidatedItem(originalValue: stringRead, validator: settings)
}

func getChooseSettings<T>(costumizationBlock: ChooseSettings<T> -> Void) -> ChooseSettings<T> {
    let settings = ChooseSettings<T>()
    costumizationBlock(settings)
    return settings
}