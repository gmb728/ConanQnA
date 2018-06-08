//
//  PagebyWebViewViewController.swift
//  Qna
//
//  Created by Chang Sophia on 2018/6/8.
//  Copyright © 2018年 SHIH-YING PAN. All rights reserved.
//

import UIKit

class PageByWebView{
    
    var url:String
    var webView:UIWebView
    
    func show(){
        guard
            let pageUrl = URL(string: url)
            else { return }
        webView.loadRequest(URLRequest(url: pageUrl))
    }
    
    init(url:String ,webViewName webView: UIWebView) {
        self.webView = webView
        self.url = url
    }
}




