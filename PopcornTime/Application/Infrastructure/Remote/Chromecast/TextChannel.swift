//
//  TextChannel.swift
//  PopcornTime
//
//  Created by Klevison Matias on 10/15/15.
//  Copyright © 2015 Klevison Matias. All rights reserved.
//

import Foundation

class TextChannel : GCKCastChannel {
    
    override func didReceiveTextMessage(message: String!) {
        print("Received message: \(message)")
    }
    
}