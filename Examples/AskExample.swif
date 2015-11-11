#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline

// Ask for a String
let answer1 = ask("Whats your name?")
print("\nYour name is \(answer1)\n")


// Ask for an Int
let age = ask("How old are you?", type: Int.self)
print("\nYour age is \(age)\n")


// Ask with validation
let name = ask("Who are you?") { settings in
    settings.addInvalidCase("Snuffles is not allowed") { value in
        value.containsString("Snuffles")
    }
}
print("\nYour are \(name)\n")


// Ask with confirm
let cake = ask("Do you like cake?") { settings in
    settings.confirm = true
}
print("\nYour are \(cake)\n")
