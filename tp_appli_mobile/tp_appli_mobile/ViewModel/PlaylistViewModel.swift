//
//  Playlist.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation



class PlaylistViewModel: ObservableObject {
    
    @Published var musics = [MusicViewModel]()
    
    init() {
        self.loadData()
    }
    
    func loadData() {
        
        let musicData: [Music] = Bundle.main.decode([Music].self, from: "playlist.json")
                
        for data in musicData {
            musics.append(MusicViewModel(Music(trackName: data.trackName, artist: data.artist, album: data.album)))
        }
    }
    
    func add(music: MusicViewModel) {
        self.musics.append(music)
    }
}
