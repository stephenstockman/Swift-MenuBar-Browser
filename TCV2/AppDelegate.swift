//
//  AppDelegate.swift
//  TCV2
//
//  Created by Stephen Stockman on 6/4/15.
//  Copyright (c) 2015 Eyewyre. All rights reserved.
//

import Cocoa
import WebKit
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
   @IBOutlet weak var pinCheck: NSButton!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    var pinned = true
    //show it
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSMinYEdge)
        }
        if(!pinned){
        eventMonitor?.start()
        }
    }
    
    //close it
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        if(!pinned){
        eventMonitor?.stop()
        }
    }
    
    //toggle it
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    
    //set icon and action
    func applicationDidFinishLaunching(notification: NSNotification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "tcIcon")
            button.action = Selector("togglePopover:")
        }
        //display the custom view controller
        popover.contentViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        eventMonitor = EventMonitor(mask: .LeftMouseDownMask | .RightMouseDownMask) { [unowned self] event in
            if self.popover.shown {
                self.closePopover(event)
               
            }
        }
        if(!pinned){
        eventMonitor?.start()
        }
        
    }
   }

  




