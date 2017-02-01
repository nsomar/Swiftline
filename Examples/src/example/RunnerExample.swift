#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline


// Simpler runner
let result1 = run("ls -all")
print("Result \n\(result1.stdout)\n")

// Run with arguments
let result2 = run("ls", args: "-all")
print("Result \n\(result2.stdout)\n")


// Costumize run
let result3 = run("ls -all") { settings in
    settings.dryRun = true
    settings.echo = [.Stdout, .Stderr, .Command]
    settings.interactive = false
}
print("Result \n\(result3.stdout)\n")
