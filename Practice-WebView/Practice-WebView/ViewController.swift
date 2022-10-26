//
//  ViewController.swift
//  Practice-WebView
//
//  Created by Aswin Sasikanth Kanduri on 2022-10-21.
//

import UIKit

import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.webView.frame.size.height))
        
        self.view.addSubview(webView)
        
        let url = URL(string: "https://www.google.com/")
        
        webView.load(URLRequest(url: url!))
        
    }
    
}
