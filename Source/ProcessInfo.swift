//
//  ProcessInfo.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 26/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol ProcessInfoType {
  var arguments: [String] { get }
  var cacheResults: Bool { get }
}

extension Foundation.ProcessInfo: ProcessInfoType {
  var cacheResults: Bool { return true }
}

class DummyProcessInfo: ProcessInfoType {

  var argsToReturn: [String]

  init(_ argsToReturn: String...) {
    self.argsToReturn = argsToReturn
  }

  var arguments: [String] {
    return argsToReturn
  }

  var cacheResults: Bool { return false }
}

class ProcessInfo {

  static var internalProcessInfo: ProcessInfoType = Foundation.ProcessInfo()

  static var arguments: [String] {
    return internalProcessInfo.arguments
  }

  static var cacheResults: Bool {
    return internalProcessInfo.cacheResults
  }

}
