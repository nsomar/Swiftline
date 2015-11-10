//
//  main.swift
//  swiftline
//
//  Created by Omar Abdelhafith on 10/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


let choice = choose("Choose the best programming language? ", choices: "Swift", "Objective", "Ruby", "Python", "Java :S")
print("\nYou choosed " + choice.f.Green)