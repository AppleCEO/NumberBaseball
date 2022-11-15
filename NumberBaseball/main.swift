//
//  main.swift
//  NumberBaseball
//
//  Created by joon-ho kil on 2022/11/15.
//

import Foundation


var count = 9
let answers = get3Numbers()
for tryCount in 1...count {
    let remainCount = count - tryCount
    let challenge = get3Numbers()
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
    if remainCount == 0 && strikeCount != 3 {
        print("컴퓨터 승리...!")
    }
    print("남은 기회 : \(count - tryCount)")
}

func get3Numbers() -> [Int] {
    var numbers = [Int]()
    
    while numbers.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers
}
