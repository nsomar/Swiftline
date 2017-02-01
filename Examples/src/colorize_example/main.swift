import Swiftline


// To change the text color, use either string.f or string.foreground:
print("Red String".f.red)
print("Blue String".foreground.blue)


// To change the text background color, use either string.b or string.background:
print("I have a white background".b.white)
print("My background color is green".background.green)


// To change the text background color, use either string.s or string.style:
print("I am a bold string".s.bold)
print("I have an underline".style.underline)


// You can compose foreground, background, and style:
print("I am an underlined red on white string".s.underline.f.red.b.white)
