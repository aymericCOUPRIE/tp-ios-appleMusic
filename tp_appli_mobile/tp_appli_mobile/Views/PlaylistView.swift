//
//  PlaylistView.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import SwiftUI

struct PlaylistView: View {
    
    @State var playlist = PlaylistViewModel()
    
    var body: some View {
        
        
        
        NavigationView {
            List {
                ForEach(playlist.musics) { music in
                    Text("\(music.trackName)")
                }
            }
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
