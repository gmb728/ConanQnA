//
//  ViewController.swift
//  Qna
//
//  Created by SHIH-YING PAN on 2018/5/15.
//  Copyright © 2018 SHIH-YING PAN. All rights reserved.
//

import UIKit
import GameKit


class ViewController: UIViewController {
    func questionsRandom(){
        let randomDistribution = GKRandomDistribution(lowestValue:0, highestValue: count-1)
        var number = randomDistribution.nextInt()
        number = randomDistribution.nextInt()
        return number
    }
        func choicesRandom(){
            let randomDistribution = GKRandomDistribution(lowestValue:0, highestValue: count-1)
            var number = randomDistribution.nextInt()
            number = randomDistribution.nextInt()
            return number
        }
        
    
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeLabel: UILabel!
    var questions = [Question]()
    var questionNumber = 0
    @IBOutlet var choicesLabel: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        let question = questions[questionNumber]
        let number = sender.tag
        if question.choices[number] == question.answer {
            grade = grade + 10
        }
        questionNumber = questionNumber + 1
        print(questionNumber)
        if questionNumber == questions.count {
            gradeView.isHidden = false
            gradeLabel.text = "\(grade)"
        } else {
            let newQuestion = questions[questionNumber]
            questionLabel.text = newQuestion.description
            var i = 0
            for label in choicesLabel{
                label.text = newQuestion.choices[i]
                i = i + 1
            }
        }
        
   
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         gradeView.isHidden = true
    
        questions.append(Question(description: "小西瓜喜歡吃什麼？", answer: "草莓", choices: ["香蕉", "草莓", "西瓜"]))
        questions.append(Question(description: "小西瓜喜歡做什麼？", answer: "畫畫", choices: ["畫畫", "踢球", "寫作業"]))
        questions.append(Question(description: "小西瓜幾歲？", answer: "七歲", choices: ["五歲", "六歲", "七歲"]))
        questions.append(Question(description: "小西瓜沒去過的國家", answer: "美國", choices: ["日本", "美國", "韓國"]))
        questions.append(Question(description: "小西瓜害怕的東西？", answer: "孤單", choices: ["蟑螂", "孤單", "蜘蛛"]))
        questions.append(Question(description: "小西瓜最喜歡的書？", answer: "露露拉拉", choices: ["露露拉拉", "星際大戰", "復仇者聯盟"]))
        questions.append(Question(description: "小西瓜最喜歡的卡通？", answer: "柯南", choices: ["佩佩豬", "柯南", "小丸子"]))
        questions.append(Question(description: "小西瓜最喜歡的甜點", answer: "草莓蛋糕", choices: ["草莓蛋糕", "提拉米蘇", "檸檬派"]))
        questions.append(Question(description: "小西瓜最討厭的事？", answer: "上學", choices: ["玩玩具", "上學", "睡覺"]))
        questions.append(Question(description: "小西瓜最好的朋友？", answer: "妹妹", choices: ["爸爸", "媽媽", "妹妹"]))
        questions.append(Question(description: "小西瓜最常說的話？", answer: "哪有", choices: ["等一下", "不要", "哪有"]))
         questions.append(Question(description: "小西瓜最高興的事？", answer: "媽咪放假", choices: ["媽咪放假", "爸爸有空", "妹妹陪玩"]))
         questions.append(Question(description: "小西瓜最好的科目？", answer: "數學", choices: ["國語", "英文", "數學"]))
        questions.append(Question(description: "小西瓜體重？", answer: "17kg", choices: ["15kg", "16kg", "17kg"]))
        questions.append(Question(description: "小西瓜最喜歡去的地方？", answer: "兒童樂園", choices: ["動物園", "兒童樂園", "植物園"]))
        questions.append(Question(description: "小西瓜的媽媽叫什麼？", answer: "Sophia", choices: ["Sophie", "Sophia", "Sabrina"]))
        
       let question = questions[0]
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

