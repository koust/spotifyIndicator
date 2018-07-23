//
//  ViewController.swift
//  spotifyIndicator
//
//  Created by Batuhan Saygili on 22.07.2018.
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let spotifyIndicator = SpotifyIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spotifyIndicator.yourView = self.view
        spotifyIndicator.yourViewAlpha = 0.8
        spotifyIndicator.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.spotifyIndicator.stop()
        }
    }
    
    



}

