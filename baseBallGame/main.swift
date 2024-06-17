//
//  main.swift
//  baseBallGame
//
//  Created by 신효범 on 6/12/24.
//

import Foundation


//컴퓨터 랜덤값
func computer() -> [Int] {
    var computerNumbers: [Int] = []
    
    let randomfirstNum = Int.random(in: 1...9)
    computerNumbers.append(randomfirstNum)                 // 먼저 첫번째 자리 수가 저장
    
    while computerNumbers.count < 3 {
        let randomNum = Int.random(in: 0...9)       // 그다음 실행 되어 나머지 두자리를 저장
        if !computerNumbers.contains(randomNum) {
            computerNumbers.append(randomNum)
        }
    }
        return computerNumbers
}

var randomComputerResult = computer()

//플레이어 값 입력
func player() -> [Int] {
    var playerResult: [Int] = []
    print("숫자를 입력하세요 : ")
    if let stringInput = readLine(){
        if stringInput.count == 3 {
            for seprateNum in stringInput{
                if let seprate = Int(String(seprateNum)){
                    playerResult.append(seprate)
                }
            }
        }
    }
    return playerResult
}

//비교
func compare(playerNum: [Int], randomComputerResult: [Int]) -> (strike: Int, ball: Int) {
    var strike = 0
    var ball = 0
    
    for n in 0..<playerNum.count {
        if playerNum[n] == randomComputerResult[n]{
            strike += 1
        }
        else if randomComputerResult.contains(playerNum[n]) {
            ball += 1
        }
    }
    return (strike, ball)
}

    
//게임 플레이
while true{
    let playerNum = player()
    if playerNum.count == 3 && playerNum.first != 0 &&
        playerNum[0] != playerNum[1] &&
        playerNum[0] != playerNum[2] &&
        playerNum[1] != playerNum[2] {
        let result = compare(playerNum: playerNum, randomComputerResult: randomComputerResult)
        print("\(result.strike)스트라이크 \(result.ball)볼 입니다.")
        if result.strike == 3{
            print("정답입니다.")
            break
        }
    }else if playerNum.count < 3 {
        print("숫자를 3개 입력하세요")
    }else if playerNum.first == 0 {
        print("0이 제일 앞에 있습니다.")
    }else if playerNum[0] == playerNum[1] ||
            playerNum[0] == playerNum[2] ||
            playerNum[1] == playerNum[2] {
                print("숫자가 중복되었습니다.")
    }
}



