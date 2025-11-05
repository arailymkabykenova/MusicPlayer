//
//  ViewController.swift
//  playerApp
//
//  Created by Арайлым Кабыкенова on 03.11.2025.
//

import UIKit
import AVFAudio
class ViewController: UIViewController {
    
    @IBOutlet weak var backImage: UIImageView!
    var songPlayer:AVAudioPlayer!
    var songName:String?
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var durationShowing: UIProgressView!
    
    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var prevButtonLabel: UIButton!
    
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var playStopLabel: UIButton!
    @IBAction func prevSongButton(_ sender: UIButton) {
        let prevSongName=prevSong(songLabel.text!,songArray)
        songLabel.text=prevSongName
        songImage.image=UIImage(named:prevSongName)
        backImage.image=UIImage(named:prevSongName)
        checkPlay()
    }
    
    
    var isPlay:Bool=false
    @IBAction func playButton(_ sender: UIButton) {
        print(isPlay)
        if !isPlay{
            if songPlayer == nil{
                playMusic()
            }
            else{
                songPlayer.play()
            }
            playStopLabel.setImage(UIImage(named:"pause"), for: .normal)
            isPlay=true
        }else{
            songPlayer.pause()
            isPlay=false
            playStopLabel.setImage(UIImage(named:"play"), for: .normal)
        }
    }
    
    @IBAction func nextSongButton(_ sender: UIButton) {
        let nextSong=nextSong(songLabel.text!,songArray)
            songLabel.text=nextSong
            songImage.image=UIImage(named:nextSong)
            backImage.image=UIImage(named:nextSong)
        backImage.alpha=0.4
        checkPlay()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songName=songLabel.text
        durationShowing.isHidden=true
        
}
    
    //play
    func playMusic(){
        guard let url=Bundle.main.url(forResource: songLabel.text, withExtension: "m4a") else{
            return print("file wasn't found")
        }
        do{
            songPlayer=try AVAudioPlayer(contentsOf: url)
            songPlayer.play()
        }
        catch{
            print("Here error:\(error)")
        }
    }
    
    func checkPlay(){
        if isPlay{
                playMusic()
            }
            else{
                playMusic()
            songPlayer.pause()
            
        }
    }
    
    

}

