//
//  alu.swift
//  Swift8Bit
//
//  Created by Scope.H on 2023/03/30.
//

import Foundation
struct ALU {
    private func halfAdder(_ a: UInt8, _ b: UInt8) -> (UInt8, UInt8) {
        var _a = a << 7
        _a >>= 7
        var _b = b << 7
        _b >>= 7
        return (_a^_b, _a&_b)
    }
    
    private func fullAdder(_ a: UInt8, _ b: UInt8, _ carry: UInt8 = 0) -> (UInt8, UInt8) {
        var _a = a << 7
        _a >>= 7
        var _b = b << 7
        _b >>= 7
        let sum1 = halfAdder(_a, _b)
        let sum2 = halfAdder(sum1.0, carry)
        return (sum2.0, sum1.1 | sum2.1)
    }
    
    func adder(_ a: UInt8, _ b: UInt8, _ carry: UInt8 = 0) -> (UInt8, UInt8) {
        var sum: UInt8 = 0
        var carry: UInt8 = 0
        for i in 0..<8 {
            var _a = a << (7 - i)
            _a >>= 7
            var _b = b << (7 - i)
            _b >>= 7
            
            let result = fullAdder(_a, _b, carry)
            sum = sum | (result.0 << i)
            carry = result.1
        }
        
        return (sum, carry)
    }
    
    func subtracter(_ a: UInt8, _ b: UInt8, _ carry: UInt8 = 0) -> (UInt8, UInt8) {
        var difference: UInt8 = 0
        var carry: UInt8 = 1
        let bComp: UInt8 = adder(~b, 1).0
        
        (difference, carry) = adder(a, bComp, carry)
        
        return (difference, carry)
    }
}
