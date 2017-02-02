//
//  ChooseSettings.swift
//  ChooseSettings
//
//  Created by Omar Abdelhafith on 03/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


/**
 Choice index type
 
 - Letters: Use letters as choice index (a. b. c.)
 - Numbers: Use numbers as choice index (1. 2. 3.)
 */
public enum ChoiceIndexType {
    case letters
    case numbers
}



/// Settings to costumize the behavior of choose
public class ChooseSettings<T> {
    typealias Item = T
    
    var choices: [(choice: String, callback: (Void) -> T)] = []
    
    /// Prompt message to use
    public var promptQuestion = ""
    
    /// Choice index used for choose items
    public var index = ChoiceIndexType.numbers
    
    /// Index suffix used between the index and the item
    public var indexSuffix = ". "
    
    /**
     Add a new item to the list of choices
     
     - parameter choice:   Item name
     - parameter callback: callback called when the item is selected, the value returned from this call back will be returned from choose
     */
    public func addChoice(_ choice: String..., callback: @escaping (Void) -> T) {
        choice.forEach {
            choices.append(($0, callback))
        }
    }
    
    // MARK:- Internal
    
    func validChoices() -> [String] {
        let validChoices = Array(1...choices.count).map { "\($0)" }
        return validChoices + stringChoices()
    }
    
    func stringChoices() -> [String] {
        return choices.map { $0.choice }
    }
    
    func choiceForInput(_ item: String) -> T? {
        if let value = Int(item) {
            return choiceWithIntValue(value)
        } else {
            return choiceWithStringValue(item)
        }
    }
    
    func choiceWithIntValue(_ value: Int) -> T? {
        let index = value - 1
        if index >= 0 && index < choices.count {
            return choices[index].callback()
        }
        
        return nil
    }
    
    func choiceWithStringValue(_ value: String) -> T? {
        let possibleIndex = choices.index { $0.choice == value }
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
        return stringChoices().enumerated().map { itemIndex, string in

            if index == .numbers {
                return "\(itemIndex + 1)"
            } else {
                let character = "a".unicodeScalars.first!.value + UInt32(itemIndex)
                return String(Character(UnicodeScalar(character)!))
            }
        }
    }
    
}

// MARK:- Internal Class

extension ChooseSettings: AskerValidator {
    func validatedItem(forString string: String) -> T {
        return choiceForInput(string)!
    }
    
    func invalidItemMessage(_ string: String?) -> String? {
        if choiceForInput(string!) != nil {
            return nil
        }
        
        let baseMessage = "You must choose one of"
        let choicesString = validChoices().joined(separator: ", ")
        
        return "\(baseMessage) [\(choicesString)]."
    }
    
    func newItemPromptMessage() -> String {
        return "?  "
    }
}
