//
//  MenuViewController.swift
//  TCV2
//
//  Created by Stephen Stockman on 6/4/15.
//  Copyright (c) 2015 Eyewyre. All rights reserved.
//

import Cocoa
import WebKit
import Foundation

class MenuViewController: NSViewController {
    @IBOutlet weak var webView: WebView!

    @IBOutlet weak var reloadButton: NSButton!
   
    @IBOutlet weak var forwardButton: NSButton!
    @IBOutlet weak var backButton: NSButton!
    @IBOutlet weak var timeLabel: NSTextField!
    
     let popover = NSPopover()
    @IBOutlet var customView: NSView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // WebView setup and load
        let url = NSURL(string:"http://teamcity.eyewyre.com:8111")
        var req = NSURLRequest(URL: url!)
        self.webView.mainFrame.loadRequest(req)
        
        //Timestamp display
        let timestampStart = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
       self.timeLabel.stringValue = timestampStart

    }
    
    @IBAction func reloadPressed(sender: AnyObject) {
        //reload last argument passed to loadRequest
        self.webView.mainFrame.reload()
        
        //Timestamp update display
         let timestampUpdate = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        self.timeLabel.stringValue = timestampUpdate
        
    }
    
    @IBAction func back(sender: AnyObject) {
        webView.goBack()
    }

    @IBAction func forward(sender: AnyObject) {
        webView.goForward()
    }
}
