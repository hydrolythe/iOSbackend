//
//  File.swift
//  
//
//  Created by Guylian Bollon on 29/10/2020.
//

import Vapor

enum Spell{
    case HEALPLAYER
    case HEALMONSTER
    case BOOSTATTACK
    case BOOSTDEFENSE
    case BOOSTMAGICATTACK
    case BOOSTMAGICDEFENSE
    case HEALMP
}
extension Spell:Codable{
    enum Key:CodingKey{
        case rawValue
    }
    enum CodingError:Error{
        case unknownValue
    }
    init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue{
        case 0:
            self = .HEALPLAYER
        case 1:
            self = .HEALMONSTER
        case 2:
            self = .BOOSTATTACK
        case 3:
            self = .BOOSTDEFENSE
        case 4:
            self = .BOOSTMAGICATTACK
        case 5:
            self = .BOOSTMAGICDEFENSE
        case 6:
            self = .HEALMP
        default:
            throw CodingError.unknownValue
        }
    }
    func encode(to encoder:Encoder) throws{
        var container = encoder.container(keyedBy: Key.self)
        switch self{
        case .HEALPLAYER:
            try container.encode(0, forKey:.rawValue)
        case .HEALMONSTER:
            try container.encode(1, forKey:.rawValue)
        case .BOOSTATTACK:
            try container.encode(2, forKey: .rawValue)
        case .BOOSTDEFENSE:
            try container.encode(3, forKey: .rawValue)
        case .BOOSTMAGICATTACK:
            try container.encode(4, forKey: .rawValue)
        case .BOOSTMAGICDEFENSE:
            try container.encode(5, forKey: .rawValue)
        case .HEALMP:
            try container.encode(6, forKey: .rawValue)
        }
    }
}
