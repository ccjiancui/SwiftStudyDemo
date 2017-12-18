//: [Previous](@previous)

// 错误处理

import Foundation

/*
 * 表达式计算编译器
 * 构建一个两步编译器, 实现一个函数用于计算 10 + 3 + 5, 函数返回整数 18
 * 表达式计算编译器的第一步是词法分析(lexing). 词法分析是把输入转化为一个符号(token)序列
 * 符号就是某种有意义的东西, 比如数和加号(编译器认识的两种符号), 词法分析有时候被称为"符号化", 把对编译器无意义输入变为有意义符号序列
 * 过程中会用到 Swift 中用来处理可恢复错误(recoverable error)和不和恢复错误(nonrecoverable error)的设施
 */

/// 符号序列
enum Token {
    case number(Int)
    case plus
}

/// 词法分析器
class Lexer {
    enum Error: Swift.Error {
        case invalidCharacter(Character)
    }
    
    let input: String
    var position: String.Index
    
    init(input: String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    // 查看
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    // 前进
    func advance() {
        assert(position < input.endIndex, "Cannot advance past endIndex")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
                advance()
            case " ":
                // 前进, 忽略空格
                advance()
            default:
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}

/*
 * 第一个符号必须是数
 * 解析完第一个后, 要么解析器到达终点, 要么下一个是 .plus
 * 解析完 .plus 后, 下一个符号必须是数
 */

/// 解析符号
class Parser {
    enum Error: Swift.Error {
        case unexpectedEndOfInput
        case invalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // 第一个应该是数
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .plus:  // 数后面是加号合法的
                // 加号后面必须又是一个数
                let nextNumner = try getNumber()
                value += nextNumner
            case .number(_): // 数后面还是数不合法
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
}

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
//    let tokens = try! lexer.lex()
    
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing faild, but I don't know why")
//        return
//    }
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch  {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("1 + 2 + abcdefg")
evaluate("10 + 3 5")
evaluate("10 + ")




//: [Next](@next)
