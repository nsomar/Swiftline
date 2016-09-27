//
//  AgreeSettings.swift
//  AgreeSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


class AgreeSettings: AskerValidator {
    
    let positiveValues = ["Yes", "yes", "Y", "y"]
    let negativeValues = ["No", "no", "N", "n"]
    
    let prompt: String
    
    init(prompt: String) {
        self.prompt = prompt
    }
    
    func validatedItem(forString string: String) -> String {
        return string
    }
    
    func invalidItemMessage(_ string: String?) -> String? {
        if let message = string , positiveValues.contains(message) || negativeValues.contains(message) {
            return nil
        }
        
        return "Please enter \"yes\" or \"no\"."
    }
    
    func newItemPromptMessage() -> String {
        return "\(prompt)  "
    }
    
    func isPositive(_ item: String) -> Bool {
        return positiveValues.contains(item)
    }
    
}
