//
//  Runner.swift
//  🏃
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


class 🏃{
    
    class func runWithoutCapture(command: String) -> Int {
        let initalSettings = RunSettings()
        initalSettings.interactive = true
        return run(command, args: [], settings: initalSettings).exitStatus
    }
    
    class func run(command: String, args: String...) -> RunResults {
        return run(command, args: args as [String])
    }
    
    class func run(command: String, args: [String]) -> RunResults {
        let settings = RunSettings()
        return run(command, args: args, settings: settings)
    }
    
    class func run(command: String, settings: (RunSettings -> Void)) -> RunResults {
        let initalSettings = RunSettings()
        settings(initalSettings)
        
        return run(command, args: [], settings: initalSettings)
    }
    
    class func run(command: String, args: [String], settings: (RunSettings -> Void)) -> RunResults {
        let initalSettings = RunSettings()
        settings(initalSettings)
        
        return run(command, args: args, settings: initalSettings)
    }
    
    class func run(command: String, echo: EchoSettings) -> RunResults {
        let initalSettings = RunSettings()
        initalSettings.echo = echo
        return run(command, args: [], settings: initalSettings)
    }
    
    class func run(command: String, args: [String], settings: RunSettings) -> RunResults {
        
        let commandParts = commandToRun(command, args: args)
        
        var result: RunResults!
        
        echoCommand(commandParts, settings: settings)
        
        if settings.dryRun {
            result = executeDryCommand(commandParts)
        } else if settings.interactive {
            result = executeIneractiveCommand(commandParts)
        } else {
            result = executeActualCommand(commandParts)
        }
        
        echoResult(result, settings: settings)
        
        return result
    }
    
    private class func executeDryCommand(commandParts: [String]) -> RunResults {
        return execute(commandParts, withExecutor: DryTaskExecutor())
    }
    
    private class func executeIneractiveCommand(commandParts: [String]) -> RunResults {
        return execute(commandParts, withExecutor: InteractiveTaskExecutor())
    }
    
    private class func executeActualCommand(commandParts: [String]) -> RunResults {
        return execute(commandParts, withExecutor: CommandExecutor.currentTaskExecutor)
    }
    
    private class func execute(commandParts: [String], withExecutor executor: TaskExecutor) -> RunResults {
        let (status, stdoutPipe, stderrPipe) = executor.execute(commandParts)
        
        let stdout = readPipe(stdoutPipe).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let stderr = readPipe(stderrPipe).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        return RunResults(exitStatus: status, stdout: stdout, stderr: stderr)
    }
    
    private class func commandToRun(command: String, args: [String]) -> [String] {
        return splitCommandToArgs(command) + args
    }
    
    private class func echoCommand(command: [String], settings: RunSettings) {
        if settings.echo.contains(.Command) {
            echoStringIfNotEmpty("Command", string: command.joinWithSeparator(" "))
        }
    }
    
    private class func echoResult(result: RunResults, settings: RunSettings) {
        if settings.echo.contains(.Stdout) {
            echoStringIfNotEmpty("Stdout", string: result.stdout)
        }
        
        if settings.echo.contains(.Stderr) {
            echoStringIfNotEmpty("Stderr", string: result.stderr)
        }
        1}
    
    private class func echoStringIfNotEmpty(title: String, string: String) {
        if !string.isEmpty {
            PromptSettings.print("\(title): \n\(string)")
        }
    }
}
