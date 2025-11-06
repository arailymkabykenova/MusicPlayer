//
//  ViewController.swift
//  playerApp
//
//  Created by Арайлым Кабыкенова on 03.11.2025.
//

import UIKit
import AVFAudio
class ViewController: UIViewController {
    var currentIndex:Int=0
    func nextSong(_ songArray:[Song])->Int{
            if currentIndex<songArray.count-1{
                currentIndex+=1
                return currentIndex
            }else{
                currentIndex=0
                return 0
            }
        }
    func prevSong(_ songArray:[Song])->Int{
        let length=songArray.count
        if currentIndex>0{
            currentIndex-=1
            return currentIndex
            
        }else{
            currentIndex=length-1
            return currentIndex
        }
    }
    @IBAction func playerButtons(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            playStopMusic()
        case 1:
            turnPrevSong()
        case 2:
            turnNextSong()
        default:
            return
        }
            
    }
    
    @IBOutlet weak var backImage: UIImageView!
    var songPlayer:AVAudioPlayer!
    var songName:String?
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var durationShowing: UIProgressView!
    
    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var prevButtonLabel: UIButton!
    
    @IBOutlet weak var nextButtonLabel: UIButton!
    @IBOutlet weak var playStopLabel: UIButton!
    
    var isPlay:Bool=false
   
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationShowing.isHidden=true
        
}
    func playStopMusic(){
        if !isPlay{
            if songPlayer == nil{
                playMusic(songArray,currentIndex)
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
    func turnPrevSong(){
        let prevSongName=prevSong(songArray)
        updateUI(prevSongName)
        checkPlay()
    }
    
    func turnNextSong(){
        let nextSong=nextSong(songArray)
        updateUI(nextSong)
        checkPlay()
    }
    func checkPlay(){
        playMusic(songArray,currentIndex)
        if !isPlay{
            songPlayer.pause()
            }
    }

    func playMusic(_ songArray:[Song],_ currentSong:Int){
        guard let url=Bundle.main.url(forResource: songArray[currentSong].name, withExtension: "m4a") else{
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
    
  
    func updateUI(_ currentSong:Int){
        songLabel.text="\(songArray[currentSong].name) - \(songArray[currentSong].artist)"
        songImage.image=UIImage(named:songArray[currentSong].songImage)
        backImage.image=UIImage(named:songArray[currentSong].songImage)
        backImage.alpha=0.4
        
    }
    
}



