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
        
        VStack {
            Spacer()
            Group{
                HStack{
                    Text("Search music/artist")
                }
                HStack{
                    Spacer()
                    Button("Confirm") {
                        ApiReader.readURL(url: "https://itunes.apple.com/search?term=muse&entity=song&attribute=allArtistTerm")
                    }
                    Spacer()
                }
            }
        }
        
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
