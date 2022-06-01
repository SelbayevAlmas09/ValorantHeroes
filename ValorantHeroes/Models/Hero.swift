//
//  Hero.swift
//  ValorantHeroes
//
//  Created by Almas Selbayev on 28.05.2022.
//

import Foundation

struct ValorantHero: Decodable {
    let data: [Hero]
}

struct Hero: Decodable {
    let description: String
    let displayIcon: String
    let displayName: String
    let fullPortraitV2: String
    let role: Role
    let abilities: [Ability]
}

struct Role: Decodable {
    let uuid: String
    let displayName: String
    let description: String
    let displayIcon: String
    let assetPath: String
}

struct Ability: Decodable {
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}


