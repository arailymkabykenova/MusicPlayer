//
//  Logics.swift
//  playerApp
//
//  Created by Арайлым Кабыкенова on 03.11.2025.
//

var songArray=[
    Song(name:"Beautiful Things", artist: "Benson Boone", durationTime: 192, songImage: "Beautiful Things"),
    Song(name:"Sparks", artist: "Coldplay", durationTime: 227, songImage: "Sparks"),
    Song(name: "Wildflower", artist: "Billie Eilish", durationTime: 261, songImage: "Wildflower"),
    Song(name:"The First Time", artist: "Damiano David ", durationTime: 228, songImage: "The First Time"),
    Song(name:"Young and Beautiful", artist: "Lana Del Rey", durationTime: 238, songImage: "Young and Beautiful"),
    Song(name:"The Door", artist: "Teddy Swims", durationTime: 211, songImage: "The Door")
]
//Song(id:0, name:"Beautiful Things", artist: "Benson Boone", durationTime: 192, songImage: "Beautiful Things"),
//Song(id:3, name:"Sparks", artist: "Coldplay", durationTime: 227, songImage: "Sparks"),
//Song(id:1, name: "Wildflower", artist: "Billie Eilish", durationTime: 261, songImage: "Wildflower"),
//Song(id:5, name:"The First Time", artist: "Damiano David ", durationTime: 228, songImage: "The First Time"),
//Song(id:2, name:"Young and Beautiful", artist: "Lana Del Rey", durationTime: 238, songImage: "Young and Beautiful"),
//Song(id:4, name:"The Door", artist: "Teddy Swims", durationTime: 211, songImage: "The Door"),
func nextSong(_ songName:String, _ songArray:[Song])->String{
    //var position:Int=0
    for i in 0..<songArray.count{
        print("итерация:\(i)")
        if songName==songArray[i].name{
            if i<songArray.count-1{
                return songArray[i+1].name
            }else{
                return songArray[0].name
            }
           
            }
        
        }
    return ""
    }
    


