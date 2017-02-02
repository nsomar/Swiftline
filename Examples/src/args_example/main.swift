import Swiftline

print("\nPrint all Arguments")
print(Args.all)

print("\nPrint parsed Arguments")
print("Target = \(Args.parsed.flags["target"] ?? "")")
print("Framework = \(Args.parsed.flags["framework"] ?? "")")
print(Args.parsed.parameters)
