#!/usr/bin/env xcrun swift -F ./Rome/ -framework Swiftline

import Swiftline


// To change the text color, use either string.f or string.foreground:
print("Red String".f.Red)
print("Blue String".foreground.Blue)


// To change the text background color, use either string.b or string.background:
print("I have a white background".b.White)
print("My background color is green".background.Green)


// To change the text background color, use either string.s or string.style:
print("I am a bold string".s.Bold)
print("I have an underline".style.Underline)


// You can compose foreground, background, and style:
print("I am an underlined red on white string".s.Underline.f.Red.b.White)
