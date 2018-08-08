//
//  ViewController.swift
//  Qna
//
//  Created by SChang Sophia on 2018/5/15.
//  Copyright 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation



class watermelonQnAViewConrtoller: UIViewController{
    var player : AVPlayer?
        var questions = [Question]()
        var questionCount = 0
        var grade = 0
        var shuffledDistribution: GKShuffledDistribution!
        var currentQuestionNumber = 0
    
    //page 1 outlet
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeLabel: UILabel!
    //page 2 outlet
   
    @IBOutlet weak var playagain: UIButton!
    @IBOutlet var choicesLabel: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    //play again
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
  
    
    // button press&result
    @IBAction func buttonPress(_ sender: UIButton) {
        let question = questions[currentQuestionNumber]
        let number = sender.tag
        if question.choices[number] == question.answer {
            
            grade = grade + 10
            if grade >= 100 {
                resultLabel.text = "柯南達人！"
             }else if grade >= 80 {
                resultLabel.text = "差點滿分！"
            }else if grade >= 60 {
                resultLabel.text = "還可以努力！"
            }else {
                resultLabel.text = "加油！"
            }
            
        }
        
            
        //grades
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
    
    
    //question and choices
    override func viewDidLoad(){
        if let url = Bundle.main.url(forResource: "唐紅的戀歌主題曲", withExtension: "mp4") {
            player = AVPlayer(url: url)
            player?.play()
        super.viewDidLoad()
        gradeView.isHidden = true
        questions.append(Question(description: "請問在2004年第八部 《銀翼的奇術師》的基德扮成哪一位先生？", answer: "新庄先生", choices: ["藤野先生", "新庄先生", "工藤新一"]))
        questions.append(Question(description: "請問在2017年第二十一部《唐紅的戀歌》裡誰是真正的兇手？", answer: "阿知波會長", choices: ["阿知波會長", "紅葉", "阿知波會長的老婆"]))
        questions.append(Question(description: "名偵探柯南劇場版出到現在(2018)共有幾部？", answer: "22部", choices: ["24部", "22部", "23部"]))
        questions.append(Question(description: "請問在2000年第四部《瞳孔中的暗殺者》裡失去記憶的是以下哪一個人？", answer: "小蘭", choices: ["小蘭", "新一", "園子"]))
        questions.append(Question(description: "請問在2002年第六部《貝克街的亡靈》裡的殺人魔叫叫什麼？", answer: "開膛手傑克", choices: ["開膛手傑克", "開膛手巴利", "諾亞方舟"]))
        questions.append(Question(description: "請問在2003年第七部《迷宮的十字路》平次的初戀是誰？", answer: "和葉", choices: ["紅葉", "和葉", "小蘭"]))
        questions.append(Question(description: "請問在2011年第十五部《沉默的＊＊》片名是幾分鐘？", answer: "15分鐘", choices: ["13分鐘", "11分鐘", "15分鐘"]))
        questions.append(Question(description: "請問在2010年第十四部《天空的劫難船》爆炸研究所的案件發生在哪？", answer: "大阪", choices: ["東京", "九州", "大阪"]))
        questions.append(Question(description: "請問在2008年第十二部《戰慄的樂譜裡》爆炸演奏的歌曲為何？", answer: "奇異恩典", choices: ["奇異恩典", "恩典之路", "感恩的心"]))
        questions.append(Question(description: "請問柯南的作者是誰？", answer: "青山剛昌", choices: ["尾田榮一郎", "金成陽三郎", "青山剛昌"]))
        
       
   
        //question random
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
    
    
}

}
