//
//  Argument.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 26/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//
import StringScanner


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
    case shortFlag
    case longFlag
    case notAFlag
    case flagsTerminator
    
    var isFlag: Bool {
      return self != .notAFlag
    }
    
    var isFlagTerminator: Bool {
      return self == .flagsTerminator
    }
    
    init(_ argument: String) {
      
      if argument == "--" {
        self = .flagsTerminator
      } else if argument.isPrefixed(by: "--") {
        self = .longFlag
      } else if argument.isPrefixed(by: "-") {
        self = .shortFlag
      } else {
        self = .notAFlag
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
  
  var isFlagTerminator: Bool {
    return type.isFlagTerminator
  }
  
  var name: String {
    switch type {
    case .notAFlag:
      return argument
    case .shortFlag:
      return argument[with: 1..<argument.utf8.count]
    case .longFlag:
      return argument[with: 2..<argument.utf8.count]
    case .flagsTerminator:
      return ""
    }
  }
  
}
