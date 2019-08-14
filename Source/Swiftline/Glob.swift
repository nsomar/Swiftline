//
//  Glob.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 30/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation
import Darwin

class Glob {
  
  static func expand(_ pattern: String) -> [String] {
    var files = [String]()
    var gt: glob_t = glob_t()

    if (glob(pattern.cString(using: String.Encoding.utf8)!, 0, nil, &gt) == 0) {
      
      for i in (0..<gt.gl_matchc) {
        let x = gt.gl_pathv[Int(i)]
        let c = UnsafePointer<CChar>(x)!
        let s = String.init(cString: c)
        files.append(s)
      }
      
    }
    
    globfree(&gt);
    return files
  }
  
}
