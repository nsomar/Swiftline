import Foundation

typealias ExecutorReturnValue = (status: Int, standardOutput: String, standardError: String)

class CommandExecutor {
    static var currentTaskExecutor: TaskExecutor = ActualTaskExecutor()
    
    class func execute(_ commandParts: [String]) -> ExecutorReturnValue {
        return currentTaskExecutor.execute(commandParts)
    }
}


protocol TaskExecutor {
    func execute(_ commandParts: [String]) -> ExecutorReturnValue
}

extension TaskExecutor {
    func readPipes(stdoutPipe: Pipe, stderrPipe: Pipe) -> (stdout: String, stderr: String) {
        let stdout = readPipe(stdoutPipe).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let stderr = readPipe(stderrPipe).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        return (stdout, stderr)
    }
}


class DryTaskExecutor: TaskExecutor {
    func execute(_ commandParts: [String]) -> ExecutorReturnValue {
        let command = commandParts.joined(separator: " ")
        PromptSettings.print("Executed command '\(command)'")
        return (0, "", "")
    }
}


class ActualTaskExecutor: TaskExecutor {
    
    func execute(_ commandParts: [String]) -> ExecutorReturnValue  {
        let group = DispatchGroup()
        group.enter()
        
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = commandParts
        
        let stdoutPipe = Pipe()
        let stderrPipe = Pipe()
        
        task.standardOutput = stdoutPipe
        task.standardError = stderrPipe
        task.terminationHandler = { _ in group.leave() }
        task.launch()
        
        
        group.wait()
        let (stdout, stderr) = readPipes(stdoutPipe: stdoutPipe, stderrPipe: stderrPipe)
        return (Int(task.terminationStatus), stdout, stderr)
    }
    
    static var environment: [UnsafeMutablePointer<CChar>?] {
        let env = ActualTaskExecutor().execute(["env"])
        guard env.status == 0 else { return [nil] }
        
        let environment = env.standardOutput
                             .components(separatedBy: "\n")
                             .map { path in path.trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .newlines) }
                             .filter { path in !path.isEmpty }
            
        return environment.map { $0.withCString(strdup) } + [nil]
    }
}


class InteractiveTaskExecutor: TaskExecutor {
    
    func execute(_ commandParts: [String]) -> ExecutorReturnValue  {
        let argv: [UnsafeMutablePointer<CChar>?] = commandParts.map { $0.withCString(strdup) }
        defer { for case let arg? in argv { free(arg) } }
        
        var childFDActions: posix_spawn_file_actions_t? = nil
        let outputPipe: [Int32] = [-1, -1]
        
        posix_spawn_file_actions_init(&childFDActions)
        posix_spawn_file_actions_adddup2(&childFDActions, outputPipe[1], 1)
        posix_spawn_file_actions_adddup2(&childFDActions, outputPipe[1], 2)
        posix_spawn_file_actions_addclose(&childFDActions, outputPipe[0])
        posix_spawn_file_actions_addclose(&childFDActions, outputPipe[1])
        
        var pid: pid_t = 0
        let result = posix_spawn(&pid, argv[0], &childFDActions, nil, argv + [nil], ActualTaskExecutor.environment)
        
        return (Int(result), "", "")
    }
}


class LogTaskExecutor: TaskExecutor {
    let logPath: String
    
    init(logPath: String) {
        self.logPath = logPath
    }
    
    func execute(_ commandParts: [String]) -> ExecutorReturnValue  {
        let argv: [UnsafeMutablePointer<CChar>?] = commandParts.map { $0.withCString(strdup) }
        var pid: pid_t = 0
        var childFDActions: posix_spawn_file_actions_t? = nil
        let outputPipe: Int32 = 69
        let outerrPipe: Int32 = 70
        
        defer {
            for case let arg? in argv { free(arg) }
            posix_spawn_file_actions_addclose(&childFDActions, outputPipe)
            posix_spawn_file_actions_addclose(&childFDActions, outerrPipe)
            posix_spawn_file_actions_destroy(&childFDActions)
        }
        
        posix_spawn_file_actions_init(&childFDActions)
        posix_spawn_file_actions_addopen(&childFDActions, outputPipe, stdoutLogPath, O_CREAT | O_TRUNC | O_WRONLY, ~0)
        posix_spawn_file_actions_addopen(&childFDActions, outerrPipe, stderrLogPath, O_CREAT | O_TRUNC | O_WRONLY, ~0)
        posix_spawn_file_actions_adddup2(&childFDActions, outputPipe, 1)
        posix_spawn_file_actions_adddup2(&childFDActions, outerrPipe, 2)
    
        var result = posix_spawn(&pid, argv[0], &childFDActions, nil, argv + [nil], ActualTaskExecutor.environment)
        guard result == 0 else { return (Int(result), "", "") }
        waitpid(pid, &result, 0)
    
        let (stdout, stderr) = read(outputPath: stdoutLogPath, outerrPath: stderrLogPath)
        removeFiles(stdoutLogPath, stderrLogPath)
        write(atPath: logPath, content: "\(stdout)\n\(stderr)")
        
        return (Int(0), stdout, stderr)
    }
    
    private var stdoutLogPath: String { return "\(logPath)-stdout.log" }
    private var stderrLogPath: String { return "\(logPath)-stderr.log" }
    
    private func removeFiles(_ files: String...) {
        files.forEach { file in
            try? FileManager.default.removeItem(atPath: file)
        }
    }
    
    private func read(outputPath: String, outerrPath: String) -> (stdout: String, stderr: String) {
        let stdout = String(data: FileManager.default.contents(atPath: outputPath) ?? Data(), encoding: .utf8) ?? ""
        let stderr = String(data: FileManager.default.contents(atPath: outerrPath) ?? Data(), encoding: .utf8) ?? ""
        
        return (stdout, stderr)
    }
    
    private func write(atPath path: String, content: String) {
        FileManager.default.createFile(atPath: path, contents: content.data(using: .utf8), attributes: nil)
    }
}


class DummyTaskExecutor: TaskExecutor {
    var commandsExecuted: [String] = []
    let statusCodeToReturn: Int
    
    let errorToReturn: String
    let outputToReturn: String
    
    init(status: Int, output: String, error: String) {
        statusCodeToReturn = status
        outputToReturn = output
        errorToReturn = error
    }
    
    func execute(_ commandParts: [String]) -> ExecutorReturnValue {
        let command = commandParts.joined(separator: " ")
        commandsExecuted.append(command)
        
        return (statusCodeToReturn, outputToReturn, errorToReturn)
    }
}
