//
//  main.swift
//  NumberBaseball
//
//  Created by joon-ho kil on 2022/11/15.
//

import Foundation


var count = 9
let answers = get3RandomNumbers()
var mode = 0

while count > 0 {
    if mode == 0 {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
        let input = readLine()
        if input != "1" && input != "2" {
            print("입력이 잘못되었습니다")
            continue
        }
        
        if input == "2" {
            count = 0
            continue
        }
    }
    mode = 1
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 : ", terminator: "")
    let inputString = readLine()
    guard let inputString = inputString else {
        continue
    }
    
    let challenge = getStringTo3Number(string: inputString)
    if challenge.count != 3 {
        print("입력이 잘못되었습니다.")
        continue
    }
    
    count -= 1
    var strikeCount = 0
    var ballCount = 0
    for i in 0...2 {
        if answers[i] == challenge[i] {
            strikeCount += 1
        }
        if answers.contains(challenge[i]) {
            ballCount += 1
        }
    }
    ballCount -= strikeCount
    print("임의의 수 : \(challenge[0]) \(challenge[1]) \(challenge[2])")
    print("\(strikeCount) 스트라이크, \(ballCount) 볼")
    print("남은 기회 : \(count)")
    if count == 0 && strikeCount != 3 {
        print("컴퓨터 승리...!")
        mode = 0
        count = 9
    }
    if strikeCount == 3 {
        print("인간 승리...!")
        mode = 0
        count = 9
    }
}

func get3RandomNumbers() -> [Int] {
    var numbers = [Int]()
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}

func getStringTo3Number(string: String) -> [Int] {
    let strings = string.split(separator: " ")
    var numbers = [Int]()
    for string in strings {
        let number = Int(string)
        if let number = number {
            numbers.append(number)
        }
    }
    
    return numbers
}
