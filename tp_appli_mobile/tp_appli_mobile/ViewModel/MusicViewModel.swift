//
//  MusicViewModel.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation

class MusicViewModel: Identifiable {
    
    let id = UUID()
    
    private var model: Music
    
    @Published private(set) var trackName: String
    @Published private(set) var artist: String
    @Published private(set) var album: String
    
    init(_ music: Music) {
        self.model = music
        self.trackName = music.trackName
        self.artist = music.artist
        self.album = music.album
    }
}
