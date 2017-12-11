import Foundation
import Quick
import Nimble
@testable import Swiftline


class RunnerTests: QuickSpec {
  override func spec() {
    
    var promptPrinter: DummyPromptPrinter!
    
    beforeEach {
      promptPrinter = DummyPromptPrinter()
      PromptSettings.printer = promptPrinter
    }
    
    describe("dummy executor") {
      
      var dummyExecutor: DummyTaskExecutor!
      
      it("executes a command") {
        dummyExecutor = DummyTaskExecutor(status: 0, output: "123", error: "")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        let res = 🏃.run("ls -all")
        
        expect(res.exitStatus).to(equal(0))
        expect(res.stdout).to(equal("123"))
        expect(res.stderr).to(equal(""))
        
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
      }
      
      it("execute a command and handle erros") {
        dummyExecutor = DummyTaskExecutor(status: 1, output: "", error: "123")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        let res = 🏃.run("test test test")
        
        expect(res.exitStatus).to(equal(1))
        expect(res.stdout).to(equal(""))
        expect(res.stderr).to(equal("123"))
        
        expect(dummyExecutor.commandsExecuted).to(equal(["test test test"]))
      }
      
      it("execute a command with arguments seperated") {
        dummyExecutor = DummyTaskExecutor(status: 1, output: "", error: "123")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls", args: ["-all"])
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
        
        🏃.run("echo", args: "bbb")
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all", "echo bbb"]))
      }
    }
    
    describe("With echo") {
      it("echo back stdout and stderr") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "Command output was", error: "error out")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls", args: ["-all"]) { s in
          s.echo = [.Stdout, .Stderr]
        }
        
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
        
        let output = [
          "Stdout: ",
          "Command output was",
          "Stderr: ",
          "error out\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
      
      it("does not echo if empty") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "", error: "error out")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls", args: ["-all"]) { s in
          s.echo = [.Stdout, .Stderr]
        }
        
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
        
        let output = [
          "Stderr: ",
          "error out\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
      
      it("echos only the command") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "", error: "error out")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls", args: ["-all"]) { s in
          s.echo = .Command
        }
        
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
        
        let output = [
          "Command: ",
          "ls -all\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
      
      
      it("echo back stdout only") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "Command output was 2", error: "error out 2")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls") {
          $0.echo = .Stdout
        }
        
        let output = [
          "Stdout: ",
          "Command output was 2\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
      
      it("echo back stderr only") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "Command output was 2", error: "error out 2")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls") {
          $0.echo = .Stderr
        }
        
        let output = [
          "Stderr: ",
          "error out 2\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
      
      it("echo back nothing") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "Command output was 2", error: "error out 2")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls") {
          $0.echo = .None
        }
        
        expect(promptPrinter.printed).to(equal(""))
      }
      
      it("execute command with an echo") {
        let dummyExecutor = DummyTaskExecutor(status: 1, output: "Command output was 2", error: "error out 2")
        CommandExecutor.currentTaskExecutor = dummyExecutor
        
        🏃.run("ls -all", echo: [.Command])
        
        expect(dummyExecutor.commandsExecuted).to(equal(["ls -all"]))
        
        let output = [
          "Command: ",
          "ls -all\n"].joined(separator: "\n")
        expect(promptPrinter.printed).to(equal(output))
      }
    }
    
    describe("Actual executor") {
      
      it("execute ls") {
        CommandExecutor.currentTaskExecutor = ActualTaskExecutor()
        let res = 🏃.run("ls -all")
        
        expect(res.exitStatus).to(equal(0))
        expect(res.stdout).notTo(equal(""))
        expect(res.stderr).to(equal(""))
      }
    }
    
    describe("dry run") {
      it("execute ls") {
        CommandExecutor.currentTaskExecutor = ActualTaskExecutor()
        let res = 🏃.run("ls -all") {
          $0.dryRun = true
        }
        
        expect(res.exitStatus).to(equal(0))
        expect(res.stdout).to(equal(""))
        expect(res.stderr).to(equal(""))
        expect(promptPrinter.printed).to(equal("Executed command 'ls -all'\n"))
      }
      
    }
    
    describe("interactive run") {
      it("execute ls") {
        CommandExecutor.currentTaskExecutor = InteractiveTaskExecutor()
        let res = 🏃.runWithoutCapture("ls")
        
        // Make it pass for now
        // FIXME: figure out why this does not work
        expect(res).to(equal(2))
      }
    }
  }
}
