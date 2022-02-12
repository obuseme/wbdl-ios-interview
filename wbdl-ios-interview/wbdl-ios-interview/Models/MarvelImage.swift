//
//  MarvelImage.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import Foundation

struct MarvelImage: Decodable {
    let path: String
    let ext: String
    
    var url: String {
        var comp = URLComponents(string: "\(path).\(ext)")!
        comp.scheme = "https"
        return comp.url!.absoluteString
    }
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
    }
}
