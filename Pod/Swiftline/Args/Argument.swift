//
//  Argument.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 26/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

struct Option {
  let argument: Argument
  var value: String?
  
  init(argument: Argument, value: String? = nil) {
    self.argument = argument
    self.value = value
  }
}

struct Argument {
  
  enum ArgumentType {
    case ShortPrefixedFlag
    case LongPrefixedFlag
    case NotAFlag
    
    var isFlag: Bool {
      return self != .NotAFlag
    }
    
    init(_ argument: String) {
      
      if argument.hasPrefix("--") {
        self = .LongPrefixedFlag
      } else if argument.hasPrefix("-") {
        self = .ShortPrefixedFlag
      } else {
        self = .NotAFlag
      }
    }
  }
  
  let type: ArgumentType
  let argument: String
  
  init(_ argument: String) {
    self.type = ArgumentType(argument)
    self.argument = argument
  }
  
  var isFlag: Bool {
    return type.isFlag
  }
  
  var name: String {
    switch type {
    case .NotAFlag:
      return argument
    case .ShortPrefixedFlag:
      return argument[1..<argument.utf8.count]
    case .LongPrefixedFlag:
      return argument[2..<argument.utf8.count]
    }
  }
  
}

extension String {
  public subscript (range: Range<Int>) -> String {
    let length = self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
    
    var distanceFromEndIndex = length - range.endIndex
    if distanceFromEndIndex < 0 {
      distanceFromEndIndex = 0
    }
    
    let actualRange = Range(
      start: startIndex.advancedBy(range.startIndex),
      end: endIndex.advancedBy(-distanceFromEndIndex))
    
    return self[actualRange]
  }
}
