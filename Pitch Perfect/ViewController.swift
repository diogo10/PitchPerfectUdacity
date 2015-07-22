//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Barry O'Reilly on 21/07/2015.
//  Copyright (c) 2015 Merino. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioRecorderDelegate {
    
  
    @IBOutlet weak var labelRecording: UILabel!
    @IBOutlet weak var buttonStop: UIButton!
    var audioRecorder:AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
       //show or hiding things
    }
    
    override func viewDidAppear(animated: Bool) {
        //for animations
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: UIButton) {
        //TODO: record and show text
        
        labelRecording.hidden = false
        buttonStop.hidden = false
        println("click in record")
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
               
        
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        //Inside func stopAudio(sender: UIButton)
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)

    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        self.performSegueWithIdentifier("StopRecording", sender: recordedAudio)//send data to other screen define by storyboard
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let playSoundsVC:PlaySoundViewController = segue.destinationViewController as! PlaySoundViewController
        let data = sender as! RecordedAudio
        playSoundsVC.recordedAudio = data;
    }
    
    
    
    
    
}

