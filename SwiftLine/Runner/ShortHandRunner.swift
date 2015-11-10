//
//  ShortHandRunner.swift
//  ShortHandRunner

//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation

func runWithoutCapture(command: String) -> Int {
    return 🏃.runWithoutCapture(command)
}

func run(command: String, args: String...) -> RunResults {
    return 🏃.run(command, args: args as [String])
}

func run(command: String, args: [String]) -> RunResults {
    return 🏃.run(command, args: args as [String])
}

func run(command: String, settings: (RunSettings -> Void)) -> RunResults {
    return 🏃.run(command, settings: settings)
}

func run(command: String, args: [String], settings: (RunSettings -> Void)) -> RunResults {
    return 🏃.run(command, args: args, settings: settings)
}

func run(command: String, echo: EchoSettings) -> RunResults {
    return 🏃.run(command, echo: echo)
}