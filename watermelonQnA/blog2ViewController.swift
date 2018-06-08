//
//  blog2ViewController.swift
//  Qna
//
//  Created by Chang Sophia on 2018/6/8.
//  Copyright © 2018年 SHIH-YING PAN. All rights reserved.
//

import UIKit

class blog2ViewController: UIViewController {
   
 
    @IBOutlet weak var blog2: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let webPage = PageByWebView(url: "https://watermeloniloveu.pixnet.net/blog", webViewName: blog2)
        webPage.show()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
