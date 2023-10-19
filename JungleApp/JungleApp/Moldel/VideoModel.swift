//
//  VideoModel.swift
//  JungleApp
//
//  Created by Apetrei Mirel on 18.10.23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    //Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
