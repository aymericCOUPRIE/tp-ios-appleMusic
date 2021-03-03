//
//  ContentView.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //ApiReader.readURL(url: "https://itunes.apple.com/search?term=muse&entity=song&attribute=allArtistTerm")
    }
    
    var body: some View {
//        VStack {
//            TextField("Track name", text: )
//        }
        PlaylistView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
