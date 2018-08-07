//
//  blog1ViewController.swift
//  Qna
//
//  Created by Chang Sophia on 2018/6/8.
//  Copyright © 2018年 SHIH-YING PAN. All rights reserved.
//

import UIKit

class blog1ViewController: UIViewController {

   
    @IBOutlet weak var blog1: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube(videoID: "WatermelonBaby")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/watch?v=BuUgZ8xyuAs\(videoID)")
            else { return }
        blog1.loadRequest( URLRequest(url: youtubeURL) )
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
