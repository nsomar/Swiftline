<p align="center">
<img src="http://swiftline.github.io/img/intro-bg.svg" width="400" align="middle"/>
<br/>
</p>
[![Build Status](https://travis-ci.org/oarrabi/Swiftline.svg?branch=master)](https://travis-ci.org/oarrabi/Swiftline)
[![Platform](https://img.shields.io/badge/platform-osx-lightgrey.svg)](https://travis-ci.org/Swiftline/Swiftline)
[![Language: Swift](https://img.shields.io/badge/language-swift-orange.svg)](https://travis-ci.org/Swiftline/Swiftline)
[![GITTER: join chat](https://img.shields.io/badge/GITTER-join%20chat-00D06F.svg)](https://gitter.im/Swiftline?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
[![GITTER: join chat](https://img.shields.io/badge/license-MIT-000000.svg)](https://github.com/Swiftline/Swiftline/blob/oarrabi/adding-env-and-args/LICENCE)
<br/>
Swiftline is a set of tools to help you create cross platform (Mac and Linux) command line applications. Swiftline is inspired by [highline](https://github.com/JEG2/highline)
<br/>
Swiftline contains the following:

- Colorize: Helps adding colors to strings written to the terminal
- Ask , Choose  and agree: Easily create prompt for asking the user more info
- Run: A quick way to run an external command and read its standard output and standard error. (Note: moved out to its own repo [https://github.com/oarrabi/Process](https://github.com/oarrabi/Process))
- Env: Read and write environment variables [ruby-flavored](http://ruby-doc.org/core-2.2.0/ENV.html) (Note: moved out to its own repo [https://github.com/oarrabi/Env](https://github.com/oarrabi/Env))
- Args: Parses command line arguments and return a hash of the passed flags

## 🆕 Note on deprecation and the future of Swiftline
In order to keep improving on `Swiftline` some functionality has been moved to seperate projects. 
Environment reading and external command execution has been removed from `Swiftline` and promoted to their own projects.
- External command execution (Runner 🏃) can be found here [https://github.com/oarrabi/Process](https://github.com/oarrabi/Process)
- Environment reading (Env) can now be found here [https://github.com/oarrabi/Env](https://github.com/oarrabi/Env)

You can add these functionalities again to your project:
- Open your `Package.swift`
- Add `Env` and `Process` as 2 new dependencies

The updated `Package.swift` should look like:

```swift
import PackageDescription

let package = Package(name: "Example",
  dependencies: [
    .Package(url: "https://github.com/oarrabi/Swiftline", majorVersion: 0),
    .Package(url: "https://github.com/oarrabi/Env", majorVersion: 0),
    .Package(url: "https://github.com/oarrabi/Process", majorVersion: 0),
  ]
)
```

## Contents
[Usage](#usage)
[Installation](#installation)
[Examples](#examples)
[Docs](http://swiftline.github.io/docs/index.html)
[Tests](#tests)

## Usage

## Colorize 🎨
Colorize helps styling the strings before printing them to the terminal. You can change the text color, the text background and the text style.
Colorize works by extending `String` struct to add styling to it.

To change the text color, use either `string.f` or `string.foreground`:

```swift
print("Red String".f.Red)
print("Blue String".foreground.Blue)
```

To change the text background color, use either `string.b` or `string.background`:

```swift
print("I have a white background".b.White)
print("My background color is green".background.Green)
```

To change the text background style, use either `string.s` or `string.style`:

```swift
print("I am a bold string".s.Bold)
print("I have an underline".style.Underline)
```

You can compose foreground, background, and style:

```swift
print("I am an underlined red on white string".s.Underline.f.Red.b.White)
```

##  Ask, Choose, Agree ❓
Ask, Choose and Agree are used to prompt the user for more information.

### Ask
Ask presents the user with a prompt and waits for the user input.

```swift
let userName = ask("Enter user name?")
```

`userName` will contain the name entered by the user

Ask can be used to ask for value of Int, Double or Float types, to ask for an integer for example:

```swift
let age = ask("How old are you?", type: Int.self)
```

If the user prints something thats not convertible to integer, a new prompt is displayed to him, this prompt will keep displaying until the user enters an Int:

```
How old are you?
None
You must enter a valid Integer.
?  Error
You must enter a valid Integer.
?  5
5
```


Validations are added by calling `addInvalidCase` on `AskSettings`.

```swift
let name = ask("Who are you?") { settings in
    settings.addInvalidCase("Snuffles is not allowed") { value in
        value.containsString("Snuffles")
    }
}
```

If the user entered `Snuffles` ask will keep displaying the invalid message passed to `addInvalidCase`

```
Who are you?
Snuffles
Snuffles is not allowed
?  Snuffles
Snuffles is not allowed
?  Snowball

Your name is Snowball
```

`AskSettings.confirm` will ask the user to confirm his choice after entering it

```swift
let name = ask("Who are you?") { settings in
    settings.confirm = true
}
```

The above will output:

```
Who are you?
Snuffles
Are you sure?  YES

Your name is Snuffles
```

### Choose
Choose is used to prompt the user to select an item between several possible items.

To display a choice of programming lanaugage for example:

```swift
let choice = choose("Whats your favorite programming language? ",
    choices: "Swift", "Objective C", "Ruby", "Python", "Java :S")
```

This will print:

```
1. Swift
2. Objective C
3. Ruby
4. Python
5. Java :S
Whats your favorite programming language?
```

The user can either choose the numbers (1..5) or the item itself. If the user enters a wrong input. A prompt will keep showing until the user makes a correct choice

```
Whats your favorite programming language? JavaScript
You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
?  BBB
You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
?  Swift

You selected Swift, good choice!
```

You can customize the return value for each choice element. For example if you want to get an Int from the choice, you would do this

```swift
let choice = choose("Whats your favorite programming language? ", type: Int.self) { settings in
    settings.addChoice("Swift") { 42 }
    settings.addChoice("Objective C") { 20 }
}
```

The number on the left can be changed to letters, here is how you could do that:

```siwft
let choice = choose("Whats your favorite programming language? ", type: String.self) { settings in
    //choice value will be set to GOOD
    settings.addChoice("Swift") { "GOOD" }

    //choice value will be set to BAD
    settings.addChoice("Java") { "BAD" }

    settings.index = .Letters
    settings.indexSuffix = " ----> "
}
```

That will print:

```
a ----> Swift
b ----> Java
Whats your favorite programming language?
```

### Agree
Agree is used to ask a user for a Yes/No question. It returns a boolean representing the user input.

```swift
let choice = agree("Are you sure you want to `rm -rf /` ?")
```

If the user enters any invalid input, agree will keep prompting him for a Yes/No question

```
Are you sure you want to `rm -rf /` ?  What!
Please enter "yes" or "no".
Are you sure you want to `rm -rf /` ?  Wait
Please enter "yes" or "no".
Are you sure you want to `rm -rf /` ?  No

You entered false
```

## Args
Returns the arguments passed to the script. For example when calling `script -f1 val1 -f2 val2 -- val3 val4`

`Args.all ` returns an array of all the raw arguments, in this example it will be `["-f1", "val1", "-f2", "val2", "--", "val3", "val4"`

`Args.parsed ` returns a structure that contains a parsed map of arguments and an array of arguments, for this example:


`Args.parsed.parameters` returns `["val3", "val4"]`

`Args.parsed.flags` returns a dictinary of flags `["f1": "val1", "f2", "val2"]`

`Args.parsed.command` returns the name of the executable itself `"script"`

## Run 🏃
The run/execution functionality has been split out of swiftline to its own project. If you want to lanunch an external process you can use Process library  [https://github.com/oarrabi/Process](https://github.com/oarrabi/Process)

## Env
The environment reading and writing functionality has been split out of swiftline to its own project. Find it here [https://github.com/oarrabi/Env](https://github.com/oarrabi/Env)

## Installation
You can install Swiftline using Swift package manager:

Add swiftline as dependency in your `Package.swift`

```swift
import PackageDescription

let package = Package(name: "YourPackage",
dependencies: [
  .Package(url: "https://github.com/oarrabi/Swiftline.git", majorVersion: 0, minor: 3),
]
)
```

### Manual
To install Swiftline manually, copy the `src` directory from this repo to your project.

## Examples
A list of examples can be found [here](https://github.com/oarrabi/Swiftline/tree/master/Examples)

## Tests
Tests can be found [here](https://github.com/oarrabi/Swiftline/tree/master/SwiftlineTests). They can be normally run from the Xcode
.

## Documentation
Documentation can be found [here](http://swiftline.github.io/docs/index.html)

## Future Improvement
- Add gather (from [highline](https://github.com/JEG2/highline)) to ask function
- Better documentation

## Credits
Daniel Beere for creating the logo [@DanielBeere](https://twitter.com/DanielBeere) check out [danielbeere on dribble](https://dribbble.com/danielbeere)
Omar Abdelhafith current project maintainer [@ifnottrue](https://twitter.com/ifnottrue)
