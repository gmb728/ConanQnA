//
//  ViewController.swift
//  Qna
//
//  Created by SChang Sophia on 2018/5/15.
//  Copyright 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import GameKit


class watermelonQnAViewConrtoller: UIViewController{
        var questions = [Question]()
        var questionCount = 0
        var grade = 0
    var shuffledDistribution: GKShuffledDistribution!
    
    var currentQuestionNumber = 0
    
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet var choicesLabel: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playagain: UIButton!
    @IBAction func playagain(_ sender: Any) {
        gradeView.isHidden = true
        questionCount = 0
        grade = 0
        shuffledDistribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        currentQuestionNumber = shuffledDistribution.nextInt()
        let question = questions[currentQuestionNumber]
        questionLabel.text = question.description
        var i = 0
        for label in choicesLabel{
            label.text = question.choices[i]
            print(i,question.choices[i])
            i  =  i  +  1
        }
    }
  
    

    @IBAction func buttonPress(_ sender: UIButton) {
        let question = questions[currentQuestionNumber]
        let number = sender.tag
        if question.choices[number] == question.answer {
            grade = grade + 10
            if grade > 80 {
                resultLabel.text = "謝謝西瓜達人,你有在發摟西瓜日記吧！"
            }else if grade <= 60 {
                resultLabel.text = "沒關係,趕快發摟西瓜日記就可以考滿分！"
            }else {
                resultLabel.text = "萍水相逢,這樣的結果還不算太壞！"
            }
            
        }
        if questionCount == questions.count {
            gradeView.isHidden = false
            gradeLabel.text = "\(grade)"
        } else {
            questionCount = questionCount + 1
            currentQuestionNumber  = shuffledDistribution.nextInt()
            
            let newQuestion = questions[currentQuestionNumber]
            questionLabel.text = newQuestion.description
            var i = 0
            for label in choicesLabel{
                label.text = newQuestion.choices[i]
                i = i + 1
            }
        }
    }
        
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        gradeView.isHidden = true
        questions.append(Question(description: "小西瓜喜歡做什麼？", answer: "看書", choices: ["看書", "打網球", "寫作業"]))
        questions.append(Question(description: "小西瓜害怕的東西？", answer: "孤單", choices: ["蟑螂", "孤單", "蜘蛛"]))
        questions.append(Question(description: "小西瓜最喜歡的書？", answer: "露露拉拉", choices: ["露露拉拉", "星際大戰", "復仇者聯盟"]))
        questions.append(Question(description: "小西瓜最喜歡的卡通？", answer: "柯南", choices: ["佩佩豬", "柯南", "小丸子"]))
        questions.append(Question(description: "小西瓜最喜歡的甜點", answer: "草莓蛋糕", choices: ["草莓蛋糕", "提拉米蘇", "檸檬派"]))
        questions.append(Question(description: "小西瓜最討厭的事？", answer: "上學", choices: ["玩玩具", "上學", "睡覺"]))
        questions.append(Question(description: "小西瓜最高興的事？", answer: "媽咪放假", choices: ["媽咪放假", "爸爸有空", "妹妹陪玩"]))
        questions.append(Question(description: "小西瓜最好的科目？", answer: "數學", choices: ["國語", "英文", "數學"]))
        questions.append(Question(description: "小西瓜最喜歡去的地方？", answer: "兒童樂園", choices: ["動物園", "兒童樂園", "植物園"]))
        questions.append(Question(description: "小西瓜的媽媽叫什麼？", answer: "Sophia", choices: ["Sophie", "Sophia", "Sabrina"]))
        
        shuffledDistribution = GKShuffledDistribution(lowestValue: 0, highestValue: questions.count - 1)
        currentQuestionNumber  = shuffledDistribution.nextInt()
        let question = questions[currentQuestionNumber]
        questionCount = 1
        questionLabel.text = question.description
        var i = 0
        for label in choicesLabel{
            label.text = question.choices[i]
            print(i,question.choices[i])
            i  =  i  +  1
        }
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    
}


