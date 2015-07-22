//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by Barry O'Reilly on 21/07/2015.
//  Copyright (c) 2015 Merino. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var recordedAudio: RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //mainBundle() return the project path
        /*
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            audioPlayer.enableRate = true
            
            
        }else{
            println("error")
        }*/
        
        
        audioPlayer = AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func showAudio(sender: UIButton) {
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }

    @IBAction func showAudio2(sender: UIButton) {
        audioPlayer.rate = 2.5
        audioPlayer.play()
    }
    
    

    
    
    
    
}
