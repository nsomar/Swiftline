//
//  ProcessInfo.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 26/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

protocol ProcessInfoType {
  var arguments: [String] { get }
}

extension NSProcessInfo: ProcessInfoType {
}

class DummyProcessInfo: ProcessInfoType {
  
  var argsToReturn: [String]
  
  init(_ argsToReturn: String...) {
    self.argsToReturn = argsToReturn
  }
  
  var arguments: [String] {
    return argsToReturn
  }
}

class ProcessInfo {
  
  static var internalProcessInfo: ProcessInfoType = NSProcessInfo()
  
  static var arguments: [String] {
    return internalProcessInfo.arguments
  }
  
}