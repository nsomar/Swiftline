//
//  ArgsParser.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 27/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

class ArgsParser {
  
  static func parseFlags(_ args: [String]) -> ([Option], [String]) {
    var options = [Option]()
    var others = [String]()
    var previousArgument: Argument?
    var argsTerminated = false
    
    for argumentString in args {
      let argument = Argument(argumentString)
      defer { previousArgument = argument }
      
      if argsTerminated {
        others += [argumentString]
        continue
      }
      
      if argument.isFlagTerminator {
        argsTerminated = true
        continue
      }
      
      if argument.isFlag {
        options += [Option(argument: argument)]
        continue
      }
      
      if let previousArgument = previousArgument , previousArgument.isFlag {
        updatelastOption(forArray: &options, withValue: argumentString)
      } else {
        others += [argument.name]
      }
    }
    
    return (options, others)
    
  }
  
  static func updatelastOption(forArray array: inout [Option], withValue value: String) {
    var previousOption = array.last!
    previousOption.value = value
    array.removeLast()
    array += [previousOption]
  }
}
