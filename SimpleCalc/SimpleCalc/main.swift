//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var ret: Int = 0
        let size = args.count;
        if size == 1 {
            return 0
        }
        let last = Int(args[size-1])
        if (last != nil) {
            let first = (Int(args[0]))!
            let second = (Int(args[2]))!
            switch args[1] {
            case "+":
                ret = first + second;
            case "-":
                ret = first - second;
            case "/":
                ret = first / second;
            case "*":
                ret = first * second;
            default:
                ret = first % second;
            }
        } else {
            let first = (Int(args[0]))!
            switch args[size-1] {
            case "avg":
                ret = avg(args)
            case "fact":
                if (first >= 0) {
                    ret = factorial(first)
                }
            default:
                ret = args.count - 1
            }
        }
        return ret;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    public func avg(_ arr: [String]) -> Int {
        var average: Int
        var sum = 0;
        for i in 0..<(arr.count-1) {
            sum += (Int(arr[i]))!
        }
        average = sum / (arr.count-1)
        return average
    }
    
    public func factorial(_ arg: Int) -> Int {
        var fact = arg
        for i in 1..<arg {
            fact = fact * (arg - i)
        }
        return fact
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

