//
//  Chooser.swift
//  Choose
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


import Foundation

func choose(prompt: String, choices: String...) -> String {
    return choose(prompt, type: String.self) {
        for choice in choices {
            $0.addChoice(choice) { return choice }
        }
    }
}

func choose<T>(callback: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(callback)
    return choose(settings, type: T.self)
}

func choose<T>(prompt: String, type: T.Type, callback: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(callback)
    settings.promptQuestion = prompt
    return choose(settings, type: type)
}

func choose<T>(type: T.Type, callback: (ChooseSettings<T> -> Void)) -> T {
    
    let settings = getChooseSettings(callback)
    return choose(settings, type: type)
}

func choose<T>(settings: ChooseSettings<T>, type: T.Type) -> T {
    
    let items = settings.preparePromptItems()
    
    items.forEach { PromptSettings.print($0) }
    PromptSettings.print("\(settings.promptQuestion)", terminator: "")
    
    let stringRead = readStringOrEmpty()
    
    return askForValidatedItem(originalValue: stringRead, validator: settings)
}

func getChooseSettings<T>(callback: ChooseSettings<T> -> Void) -> ChooseSettings<T> {
    let settings = ChooseSettings<T>()
    callback(settings)
    return settings
}