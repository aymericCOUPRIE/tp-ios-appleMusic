//
//  PlaylistView.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import SwiftUI

struct PlaylistView: View {
    
    @State var search: String = "muse"
    @State var playlist = PlaylistViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            Group{
                HStack{
                    TextField("Search music/artist", text: $search)
                }
                HStack{
                    Spacer()
                    Button("Confirm") {
                        print("SEARCH \(search)")
                        ApiReader.readURL(url: "https://itunes.apple.com/search?term=\(search)&entity=song&attribute=allArtistTerm")
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
