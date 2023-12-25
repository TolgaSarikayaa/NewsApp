//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Tolga Sarikaya on 25.12.23.
//

import Foundation

struct NewsResponse : Decodable {
    var articles : [News]
}
