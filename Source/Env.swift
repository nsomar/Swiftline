//
//  Env.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 24/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Darwin


public class Env {
  
  /// Return the list of all the enviromenment keys passed to the script
  public static var keys: [String] {
    let keyValues = run("env").stdout.components(separatedBy: "\n")
    let keys = keyValues.map { $0.components(separatedBy: "=").first! }.filter { !$0.isEmpty }
    return keys
  }
  
  /// Return the list of all the enviromenment values passed to the script
  public static var values: [String] {
    return self.keys.map { self.get($0)! }
  }
  
  /**
   Return the enviromenment for the provided key
   
   - parameter key: The enviromenment variable key
   
   - returns: The enviromenment variable value
   */
  public static func get(_ key: String) -> String? {
    guard let value = getenv(key) else { return nil }
    return String(cString: value)
  }
  
  /**
   Set a new value for the enviromenment variable
   
   - parameter key: The enviromenment variable key
   - parameter value: The enviromenment variable value
   */
  public static func set(_ key: String, _ value: String?) {
    if let newValue = value {
      setenv(key, newValue, 1)
    } else {
      unsetenv(key)
    }
  }
  
  
  /**
   Clear all the enviromenment variables
   */
  public static func clear() {
    self.keys
      .map { String($0) }
      .filter { $0 != nil }
      .forEach{ self.set($0!, nil) }
  }
  
  /**
   Check if the enviromenment variable key exists
   
   - parameter key: The enviromenment variable key
   
   - returns: true if exists false otherwise
   */
  public static func hasKey(_ key: String) -> Bool {
    return self.keys.contains(key)
  }
  
  
  /**
   Check if the enviromenment variable value exists
   
   - parameter key: The enviromenment variable value
   
   - returns: true if exists false otherwise
   */
  public static func hasValue(_ value: String) -> Bool {
    return self.values.contains(value)
  }
  
  /**
   Iterate through the list of enviromenment variables
   
   - parameter callback: callback to call on each key/value pair
   */
  public static func eachPair(_ callback: (_ key: String, _ value: String) -> ()) {
    zip(self.keys, self.values).forEach(callback)
  }
  
}
