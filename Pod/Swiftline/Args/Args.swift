//
//  Args.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 25/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

//import Foundation

public class Args {
  
  public static func all() -> [String] {
    return ProcessInfo.arguments
  }
  
  public static func args() -> ParsedArgs {
    var result = [String: String]()
    let parsedArges = ArgsParser.parseFlags(all())
    
    parsedArges.0.forEach {
      result[$0.argument.name] = $0.value ?? ""
    }
    
    return ParsedArgs(flags: result, parameters: parsedArges.1)
  }
}


public struct ParsedArgs {
  let flags: [String: String]
  let parameters: [String]
}