//
//  ViewController.swift
//  Parsing HTML with Hpple
//
//  Created by Lucas Damiani on 17/10/15.
//  Copyright © 2015 Lucas Damiani. All rights reserved.
//

import UIKit
import hpple

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory: "www") {
            let htmlData = NSData(contentsOfFile: htmlFile)
            let htmlDocument = TFHpple(HTMLData: htmlData)
            if let htmlElements = htmlDocument.searchWithXPathQuery("//form[@id='form1']") as? [TFHppleElement] {
                if let firstForm = htmlElements.first?.raw {
                    webView.loadHTMLString(firstForm, baseURL: nil)
                }
            }
        } else {
            print("File not found")
        }
    }

}

