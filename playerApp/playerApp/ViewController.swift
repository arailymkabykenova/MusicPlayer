//
//  ViewController.swift
//  playerApp
//
//  Created by Арайлым Кабыкенова on 03.11.2025.
//

import UIKit
import AVFAudio
class ViewController: UIViewController {
    
    var songPlayer:AVAudioPlayer!
    var songName:String?
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var durationShowing: UIProgressView!
    
    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var prevButtonLabel: UIButton!
    
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var playStopLabel: UIButton!
    @IBAction func prevSongButton(_ sender: UIButton) {
    }
    
    
    var isPlay:Bool=false
    @IBAction func playButton(_ sender: UIButton) {
        print(isPlay)
        if !isPlay{
            if songPlayer == nil{
                print(isPlay)
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
        let nextSong=nextSong(songName!,songArray)
            songLabel.text=nextSong
            songImage.image=UIImage(named:nextSong)
            playMusic()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songName=songLabel.text
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
    
   
    
    

}

