import Foundation

var inputData = [Int]()
if let input = readLine() {
    inputData = input.split(separator: " ").compactMap({Int(String($0))})
}

//test data
let testData = "10 50"
inputData = testData.split(separator: " ").compactMap({Int(String($0))})
inputData
//end test data

let width = inputData[0]
let height = inputData[1]

func gradient(width: Int, height: Int) -> [Array<Int>] {
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
    let resultH = arrayRow.map {String($0)}.joined(separator: " ")
    let resultW = arrayCol.map {String($0)}.joined(separator: " ")
    print(resultH)
    print(resultW)
}


let gradientArray = gradient(width: width, height: height)

if gradientArray.isEmpty {
    print()
} else {
    sumArrayGradient(array: gradientArray)
}

