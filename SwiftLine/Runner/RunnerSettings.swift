//
//  RunSettings.swift
//  RunSettings
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


class RunSettings {
    var dryRun = false
    var echo = EchoSettings.None
    var interactive = false
}

struct EchoSettings: OptionSetType {
    let rawValue: Int
    
    static var None = EchoSettings(rawValue: 0)
    static let Stdout  = EchoSettings(rawValue: 1 << 0)
    static let Stderr  = EchoSettings(rawValue: 1 << 1)
    static let Command  = EchoSettings(rawValue: 1 << 2)
}