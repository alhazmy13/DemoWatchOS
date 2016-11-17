//
//  ViewController.swift
//  DemoWatchOS
//
//  Created by Abdullah Alhazmy on 11/17/16.
//  Copyright © 2016 Alhazmy. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate {

    var counterData = [String]()
    let session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        session?.delegate = self;
        session?.activate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?)
    {
        print(activationState.rawValue)
        
    }
    
   
    @available(iOS 9.0, *)
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) -> Void {
        print("Count = \(message["counterValue"] ?? 0)")
        countLabel.text = "Count = \(message["counterValue"] ?? 0)"
        
        
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    


}

