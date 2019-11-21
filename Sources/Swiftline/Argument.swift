//
//  Argument.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 26/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


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
      } else if argument.hasPrefix("--") {
        self = .longFlag
      } else if argument.hasPrefix("-") {
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
        return argument.components(separatedBy: "-")[1]
    case .longFlag:
      return argument.components(separatedBy: "--")[1]
    case .flagsTerminator:
      return ""
    }
  }
  
}
