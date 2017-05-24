#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline


// print(Env.get("PWD")!)
print("All Environment Variables")
print(Env.keys.joined(separator: "\n"))

print("\nPrinting value of PWD")
print(Env.get("PWD")!)

print("\nPrint all Arguments")
print(Args.all)

print("\nPrint parsed Arguments")
print(Args.parsed.flags["target"] as Any)
print(Args.parsed.flags["framework"] as Any)
print(Args.parsed.parameters)
