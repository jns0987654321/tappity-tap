//
//  ViewController.swift
//  tappity-tap
//
//  Created by Junior Samaroo on 2016-02-14.
//  Copyright © 2016 Junior Samaroo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var maxTaps = 0
    var currentTaps = 0

    // IBOutlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsText: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    // Actions
    @IBAction func onPlayButtonPressed(sender: UIButton){

        if howManyTapsText.text != nil && howManyTapsText.text != "" {
            
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsText.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsText.text!)! //unwrap or check for nil since String return value is not guranteed
            currentTaps = 0
            
            updateTapsLabel()
        }
        
    }
    
    @IBAction func onCoinTapped(sender: UIButton!){
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }

    }
    
    func updateTapsLabel(){
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        }else{
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsText.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }

}

