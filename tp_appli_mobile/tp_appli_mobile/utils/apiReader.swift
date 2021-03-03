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
            
            let string = String(data: data, encoding: .utf8)
            
            guard let s = string else { return }
            
            print(s)
            
            writeFile(filename: "data", data: s)
            
        }.resume()
    }
    
    static func writeFile(filename: String, data: String) {
        
        //let file: FileHandle? = FileHandle(forWritingAtPath: "../Data/\(filename).json")
        
        //print("FILE \(String(describing: file))")
        
        //if (file != nil) {
        
        guard let url = Bundle.main.url(
                    forResource: filename,
                    withExtension: "json"
                ) else {
                    fatalError("FILE NOT FOUND")
                }
    
        do {
                
            if let jsonData = try JSONSerialization.data(withJSONObject: filename, options:.init(rawValue: 0)) as? Data {
                file?.write(jsonData)
            }
        }
        catch {
            fatalError("CANT WRITE")
        }
            
        //    file?.closeFile()
        //}
        //else {
        //    print("echec")
        //}
    }
}
