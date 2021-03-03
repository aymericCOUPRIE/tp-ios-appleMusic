//
//  apiReader.swift
//  tp_appli_mobile
//
//  Created by etud on 19/02/2021.
//

import Foundation

struct ApiReader {
    
    static func readURL(url: String) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
                        
            guard let data = data else { return }
            
            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                
                let decoded = try JSONDecoder().decode(Initial.self, from: data)
                print(decoded.results[0])
                
                writeFile(filename: "WhereAreYou", datas: decoded.results)

            }
            catch {
                print("ERROR \(error)")
            }
            
            
            
        }.resume()
    }
    
    static func writeFile(filename: String, datas: [Music2]) {
               
        for music in datas {
            print("MUSIC \(music)")
            do {
                let jsonData = try JSONEncoder().encode(music)
                //let json = String(data: jsonData, encoding: String.Encoding.utf8)
                
                //ecrit pas dans data mais dans le telephone simulé
                if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    print(documentDirectory)
                    let pathWithFileName = documentDirectory.appendingPathComponent("myJsonData")
                    do {
                        try jsonData.write(to: pathWithFileName)
                    } catch {
                        print("ERROR1 \(error)")                    }
                } else {
                    print("ELSE")
                }
            } catch {
                print("ERROR2 \(error)")
            }
        }
        
    }
}
