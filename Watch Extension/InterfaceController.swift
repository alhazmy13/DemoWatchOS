//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Abdullah Alhazmy on 11/17/16.
//  Copyright © 2016 Alhazmy. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {
    var counter = 0
    var session : WCSession!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if (WCSession.isSupported()) {
            session = WCSession.default()
            session.delegate = self
            session.activate()
        }

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func onButtonClicked() {
        print(counter)
        let applicationData = ["counterValue":String(counter)]
        session.sendMessage(applicationData, replyHandler:  nil, errorHandler: { (error) -> Void in
            print("error")
        })
        counter += 1
    }
    

    @available(iOS 9.3, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?)
    {
    }
    
    
    
    

}
