import Foundation
var input = readLine()
var inputString = ""
inputString = input ?? ""

var width = 3
var height = 3

var digitStringW = ""
var digitStringH = ""
var total = 0
for digit in inputString {
    if digit != " " && total == 0 {
        digitStringW += String(digit)
    } else if digit != " " && total == 1 {
        digitStringH += String(digit)
    } else {
        total += 1
    }
}

width = Int(digitStringH) ?? 3
height = Int(digitStringW) ?? 3

enum ErrorRange: Error {
    case valueOutOfRange
}

var heightRange = 3...1170
var widthRange = 3...2532

func gradient(width: Int, height: Int) throws -> [Array<Int>] {
    guard heightRange.contains(height) && widthRange.contains(width) else {
        throw ErrorRange.valueOutOfRange
    }
    var rowH = 0
    var colW = 0
    var gradientArray = [Array<Int>]()
    var rowArray = [Int]()
    var total = 1
    var pixel = 0
    for row in 0...height - 1 {
        for col in 0...width - 1{
            rowH = height - row
            colW = width - 2 * col
            pixel += rowH * colW * total
            rowArray.append(pixel)
        }
        gradientArray.append(rowArray)
        rowArray.removeAll()
        pixel = 0
        total += 1
    }
    return gradientArray
}

func sumArrayGradient(array: [Array<Int>]) {
    var sumRow = 0
    var resultArray = [Array<Int>]()
    var arrayRow = [Int]()
    let countArrayCol = array[0].count
    var arrayCol = Array(repeating: 0, count: countArrayCol)
    for element in array {
        sumRow = element.reduce(0, +)
        arrayRow.append(sumRow)
        for index in element.indices {
            arrayCol[index] += element[index]
        }
    }
    resultArray.append(arrayRow)
    resultArray.append(arrayCol)
    for item in arrayCol {
        print(String(item), separator: " ", terminator: " ")
    }
    print()
    for item in arrayRow {
        print(String(item), separator: " ", terminator: " ")
    }
}

do {
    let gradientArray = try gradient(width: width, height: height)
    if gradientArray.isEmpty {
        print("no data")
    } else {
        sumArrayGradient(array: gradientArray)
    }
    
}
catch {
    print("value Out Of Range")
}

