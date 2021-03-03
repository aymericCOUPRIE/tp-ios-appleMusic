//
//  Music.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation

struct Music: Codable {
    
    private(set) var trackName: String
    private(set) var artist: String
    private(set) var album: String
    
    init(trackName: String, artist: String, album: String) {
        self.trackName = trackName
        self.artist = artist
        self.album = album
    }    
}
