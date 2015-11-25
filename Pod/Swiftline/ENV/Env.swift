//
//  Env.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 24/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

public class Env {
  
  public static func get(key: String) -> String? {
    let value = getenv(key)
    return String.fromCString(value)
  }
  
  public static func set(key: String, _ value: String?) {
    if let newValue = value {
      setenv(key, newValue, 1)
    } else {
      unsetenv(key)
    }
  }
  
  public static func clear() {
    self.keys()
      .map { String($0) }
      .filter { $0 != nil }
      .forEach{ self.set($0!, nil) }
  }
  
  public static func keys() -> [String] {
    let keyValues = run("env").stdout.componentsSeparatedByString("\n")
    let keys = keyValues.map { $0.componentsSeparatedByString("=").first! }.filter { !$0.isEmpty }
    return keys;
  }
  
  public static func values() -> [String] {
    return self.keys().map { self.get($0)! }
  }
  
  public static func hasKey(key: String) -> Bool {
    return self.keys().contains(key)
  }
  
  public static func hasValue(value: String) -> Bool {
    return self.values().contains(value)
  }
  
  public static func eachPair(callback: (key: String, value: String) -> ()) {
    zip(self.keys(), self.values()).forEach(callback)
  }
  
}
