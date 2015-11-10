//
//  ChooseSettings.swift
//  ChooseSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


enum ChoiceIndexType {
    case Letters
    case Numbers
}

class ChooseSettings<T> {
    typealias Item = T
    
    var choices: [(choice: String, callback: Void -> T)] = []
    var promptQuestion = ""
    
    var index = ChoiceIndexType.Numbers
    var indexSuffix = ". "
    
    func addChoice(choice: String..., callback: Void -> T) {
        choice.forEach {
            choices.append(($0, callback))
        }
    }
    
    func validChoices() -> [String] {
        let validChoices = Array(1...choices.count).map { "\($0)" }
        return validChoices + stringChoices()
    }
    
    func stringChoices() -> [String] {
        return choices.map { $0.choice }
    }
    
    func choiceForInput(item: String) -> T? {
        if let value = Int(item) {
            return choiceWithIntValue(value)
        } else {
            return choiceWithStringValue(item)
        }
    }
    
    func choiceWithIntValue(value: Int) -> T? {
        let index = value - 1
        if index >= 0 && index < choices.count {
            return choices[index].callback()
        }
        
        return nil
    }
    
    func choiceWithStringValue(value: String) -> T? {
        let possibleIndex = choices.indexOf { $0.choice == value }
        if let index = possibleIndex {
            return choices[index].callback()
        }
        
        return nil
    }
    
    func preparePromptItems() -> [String] {
        return zip(indexChoices(), stringChoices()).map { index, string in
            return "\(index)\(indexSuffix)\(string)"
        }
    }
    
    func indexChoices() -> [String] {
        return stringChoices().enumerate().map { itemIndex, string in

            if index == .Numbers {
                return "\(itemIndex + 1)"
            } else {
                let character = "a".unicodeScalars.first!.value + UInt32(itemIndex)
                return String(Character(UnicodeScalar(character)))
            }
        }
    }
    
}

extension ChooseSettings: AskerValidator {
    func validatedItem(forString string: String) -> T {
        return choiceForInput(string)!
    }
    
    func invalidItemMessage(string: String?) -> String? {
        if choiceForInput(string!) != nil {
            return nil
        }
        
        let baseMessage = "You must choose one of"
        let choicesString = validChoices().joinWithSeparator(", ")
        
        return "\(baseMessage) [\(choicesString)]."
    }
    
    func newItemPromptMessage() -> String {
        return "?  "
    }
}