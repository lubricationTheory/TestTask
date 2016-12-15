//
//  WebDetailViewController.swift
//  TestTask
//
//  Created by Ilya Lapan on 15/12/2016.
//  Copyright © 2016 ilyalapan. All rights reserved.
//

import UIKit

class WebDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var URL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let request = URLRequest(url: URL!)
        webView.loadRequest(request)
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
