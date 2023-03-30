// 8-bit number
// 1 1 1 1 1 1 1 1
import Foundation

let number1: UInt8 = 0b00101001
let number2: UInt8 = 0b00110100

let alu = ALU()

let sum = alu.adder(number1, number2)

print(String(sum.0, radix: 2))
print(String(sum.1, radix: 2))


let num1: UInt8 = 0b10001011
let num2: UInt8 = 0b11001001

let diff = alu.subtracter(num1, num2)
print(String(diff.0, radix: 2))
