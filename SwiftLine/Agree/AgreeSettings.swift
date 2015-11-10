//
//  AgreeSettings.swift
//  AgreeSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


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
    
    func invalidItemMessage(string: String?) -> String? {
        if positiveValues.contains(string!) || negativeValues.contains(string!) {
            return nil
        }
        
        return "Please enter \"yes\" or \"no\"."
    }
    
    func newItemPromptMessage() -> String {
        return "\(prompt)  "
    }
    
    func isPositive(item: String) -> Bool {
        return positiveValues.contains(item)
    }
    
}
