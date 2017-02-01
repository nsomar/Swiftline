#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline


// print(Env.get("PWD")!)
print("All Environment Variables")
print(Env.keys.joinWithSeparator("\n"))

print("\nPrinting value of PWD")
print(Env.get("PWD")!)

print("\nPrint all Arguments")
print(Args.all)

print("\nPrint parsed Arguments")
print(Args.parsed.flags["target"]!)
print(Args.parsed.flags["framework"]!)
print(Args.parsed.parameters)
