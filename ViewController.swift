//
//  ViewController.swift
//  tapper
//
//  Created by Eduardo Chiaro on 2/15/16.
//  Copyright © 2016 Eduardo Chiaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTappsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var counterTapps: UILabel!
    
    var maxTapps: Int = 0;
    var currentTapps: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        self.howManyTappsTxt.delegate = self;
    }

    @IBAction func startGame(sender: UIButton!){
        
        if howManyTappsTxt.text != nil && howManyTappsTxt.text != "" {
            
            maxTapps = Int(howManyTappsTxt.text!)!;
        
            logoImage.hidden = true;
            playButton.hidden = true;
            howManyTappsTxt.hidden = true;
        
        
            coinButton.hidden = false;
            counterTapps.hidden = false;
            
            currentTapps = 0;
            updateCounter();
        }
    }
    
    
    @IBAction func clickCoin(sender: UIButton!){
        currentTapps++;
        
        updateCounter();
        
        if(currentTapps == maxTapps){
            logoImage.hidden = false;
            playButton.hidden = false;
            howManyTappsTxt.hidden = false;
            
            
            coinButton.hidden = true;
            counterTapps.hidden = true;
            
            howManyTappsTxt.text = "";
            
        }
    }
    func updateCounter(){
        
        counterTapps.text = "\(currentTapps) Tapps";
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

