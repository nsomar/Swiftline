#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline


let choice = choose("Whats your favorite programming language? ",
        choices: "Swift", "Objective C", "Ruby", "Python", "Java :S")
print("You choosed \(choice)")


// Choose with Int result
let choice2 = choose("Whats your favorite programming language? ", type: Int.self) { settings in
    settings.addChoice("Swift") { 42 }
    settings.addChoice("Objective C") { 20 }
}
print("You choosed \(choice2)")


// Customize prompt
let choice3 = choose("Whats your favorite programming language? ", type: String.self) { settings in
    //choice value will be set to GOOD
    settings.addChoice("Swift") { "GOOD" }

    //choice value will be set to BAD
    settings.addChoice("Java") { "BAD" }

    settings.index = .Letters
    settings.indexSuffix = " ----> "
}
print("Your choice is \(choice3)")
