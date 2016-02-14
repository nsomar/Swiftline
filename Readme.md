<p align="center">
<img src="http://swiftline.github.io/img/intro-bg.svg" width="400" align="middle"/>
<br/>
</p>
[![Build Status](https://travis-ci.org/Swiftline/Swiftline.svg?branch=master)](https://travis-ci.org/Swiftline/Swiftline)
[![Platform](https://img.shields.io/badge/platform-osx-lightgrey.svg)](https://travis-ci.org/Swiftline/Swiftline)
[![Language: Swift](https://img.shields.io/badge/language-swift-orange.svg)](https://travis-ci.org/Swiftline/Swiftline)
[![CocoaPods](https://img.shields.io/cocoapods/v/Swiftline.svg)](https://cocoapods.org/pods/Swiftline)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GITTER: join chat](https://img.shields.io/badge/GITTER-join%20chat-00D06F.svg)](https://gitter.im/Swiftline?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
[![GITTER: join chat](https://img.shields.io/badge/license-MIT-000000.svg)](https://github.com/Swiftline/Swiftline/blob/oarrabi/adding-env-and-args/LICENCE)
<br/>
Swiftline is a set of tools to help you create command line applications. Swiftline is inspired by [highline](https://github.com/JEG2/highline)
<br/>
Swiftline contains the following:

- Colorize: Helps adding colors to strings written to the terminal
- Ask , Choose  and agree: Easily create prompt for asking the user more info
- Run: A quick way to run an external command and read its standard output and standard error.
- Env: Read and write environment variables [ruby-flavored](http://ruby-doc.org/core-2.2.0/ENV.html)
- Args: Parses command line arguments and return a hash of the passed flags

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

    How old are you?
    None
    You must enter a valid Integer.
    ?  Error
    You must enter a valid Integer.
    ?  5
    5

Validations are added by calling `addInvalidCase` on `AskSettings`.

```swift
    let name = ask("Who are you?") { settings in
        settings.addInvalidCase("Snuffles is not allowed") { value in
            value.containsString("Snuffles")
        }
    }
```
If the user entered `Snuffles` ask will keep displaying the invalid message passed to `addInvalidCase`

    Who are you?
    Snuffles
    Snuffles is not allowed
    ?  Snuffles
    Snuffles is not allowed
    ?  Snowball

    Your name is Snowball

`AskSettings.confirm` will ask the user to confirm his choice after entering it

```swift
    let name = ask("Who are you?") { settings in
        settings.confirm = true
    }
```

The above will output:

    Who are you?
    Snuffles
    Are you sure?  YES

    Your name is Snuffles
### Choose
Choose is used to prompt the user to select an item between several possible items.

To display a choice of programming lanaugage for example:
```swift
    let choice = choose("Whats your favorite programming language? ",
        choices: "Swift", "Objective C", "Ruby", "Python", "Java :S")
```

This will print:

    1. Swift
    2. Objective C
    3. Ruby
    4. Python
    5. Java :S
    Whats your favorite programming language?

The user can either choose the numbers (1..5) or the item itself. If the user enters a wrong input. A prompt will keep showing until the user makes a correct choice

    Whats your favorite programming language? JavaScript
    You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
    ?  BBB
    You must choose one of [1, 2, 3, 4, 5, Swift, Objective C, Ruby, Python, Java :S].
    ?  Swift

    You selected Swift, good choice!

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

    a ----> Swift
    b ----> Java
    Whats your favorite programming language?

### Agree
Agree is used to ask a user for a Yes/No question. It returns a boolean representing the user input.

```swift
    let choice = agree("Are you sure you want to `rm -rf /` ?")
```

If the user enters any invalid input, agree will keep prompting him for a Yes/No question

    Are you sure you want to `rm -rf /` ?  What!
    Please enter "yes" or "no".
    Are you sure you want to `rm -rf /` ?  Wait
    Please enter "yes" or "no".
    Are you sure you want to `rm -rf /` ?  No

    You entered false

## Run 🏃
Run provides a quick, concise way to run an external command and read its standard output and standard error.

To execute a simple command you would do:

```swift
    let result = run("ls -all")
    print(result.stdout)
```
`result` type is `RunResults`, it contains:

- `exitStatus`: The command exit status
- `stdout`: The standard output for the command executed
- `stderr`: The standard error for the command executed

While `run("command")` can split the arguments by spaces. Some times argument splitting is not trivial. If you have multiple argument to pass to the command to execute, you should use `run(command: String, args: String...)`. The above translates to:

```swift
    let result = run("ls", args: "-all")
```

To customize the run function, you can pass in a customization block:

```swift
    let result = run("ls -all") { settings in
        settings.dryRun = true
        settings.echo = [.Stdout, .Stderr, .Command]
        settings.interactive = false
    }
```

`settings` is an instance of RunSettings, which contains the following variables:

- `settings.dryRun`: defaults to false. If false, the command is actually run. If true, the command is logged to the stdout paramter of result
- `settings.echo`: Customize the message printed to stdout, `echo` can contain any of the following:
    - `EchoSettings.Stdout`: The stdout returned from running the command will be printed to the terminal
    - `EchoSettings.Stderr`: The stderr returned from running the command will be printed to the terminal
    - `EchoSettings.Command`: The command executed will be printed to the terminal
- `settings.interactive`: defaults to false. If set to true the command will be executed using `system` kernel function and only the exit status will be captured. If set to false, the command will be executed using `NSTask` and both stdout and stderr will be captured.
Set `interactive` to true if you expect the launched command to ask input from the user through the stdin.

`runWithoutCapture("command")` is a quick way to run a command in interactive mode. The return value is the exit code of that command.

## Env
Env is used to read and write the environment variables passed to the script
```swift
// Set enviroment variable
Env.set("key1", "value1")

// Get environment variable
Env.get("SomeKey")

// Clear all variables
Env.clear()

// Get all keys and values
Env.keys()
Env.values()
```

## Args
Returns the arguments passed to the script. For example when calling `script -f1 val1 -f2 val2 -- val3 val4`

`Args.all ` returns an array of all the raw arguments, in this example it will be `["-f1", "val1", "-f2", "val2", "--", "val3", "val4"`

`Args.parsed ` returns a structure that contains a parsed map of arguments and an array of arguments, for this example:


`Args.parsed.parameters` returns `["val3", "val4"]`

`Args.parsed.flags` returns a dictinary of flags `["f1": "val1", "f2", "val2"]`

`Args.parsed.command` returns the name of the executable itself `"script"`

## Installation
You can install Swiftline using CocoaPods, carthage and Swift package manager

### CocoaPods
    use_frameworks!
    pod 'Swiftline'

### Carthage
    github 'swiftline/swiftline'

### Swift Package Manager
Add swiftline as dependency in your `Package.swift`

```
  import PackageDescription

  let package = Package(name: "YourPackage",
    dependencies: [
      .Package(url: "https://github.com/Swiftline/Swiftline.git", majorVersion: 0, minor: 3),
    ]
  )
```

### CocoaPods + Rome plugin
If you want to use swiftline in a script you can use [Rome](https://github.com/neonichu/Rome) CocoaPods plugin. This plugin builds the framework from the pod file and place them in a Rome directory.

    platform :osx, '10.10'
    plugin 'cocoapods-rome'

    pod 'Swiftline'

### Manual
To install Swiftline manually, add `Pod/Swiftline` directory to your project.

## Examples
A list of examples can be found [here](https://github.com/oarrabi/Swiftline/tree/master/Examples)

## Tests
Tests can be found [here](https://github.com/oarrabi/Swiftline/tree/master/SwiftlineTests). They can be normally run from the Xcode
.

## Documentation
Documentation can be found [here](http://swiftline.github.io/docs/index.html)

## Future Improvement
- Add gather (from [highline](https://github.com/JEG2/highline)) to ask function
- Figure out a way to eliminate the need of `interactive`
- Add Glob handling
- Better documentation

## Credits
Daniel Beere for creating the logo [@DanielBeere](https://twitter.com/DanielBeere) check out [danielbeere on dribble](https://dribbble.com/danielbeere)
Omar Abdelhafith current project maintainer [@ifnottrue](https://twitter.com/ifnottrue)
