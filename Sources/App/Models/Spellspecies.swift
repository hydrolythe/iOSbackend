//
//  File.swift
//  
//
//  Created by Guylian Bollon on 29/10/2020.
//

import Vapor

enum Spellspecies{
    case FIELD
    case EQUIP
    case EVENT
}
extension Spellspecies:Codable{
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
            self = .FIELD
        case 1:
            self = .EQUIP
        case 2:
            self = .EVENT
        default:
            throw CodingError.unknownValue
        }
    }
    func encode(to encoder:Encoder) throws{
        var container = encoder.container(keyedBy: Key.self)
        switch self{
        case .FIELD:
            try container.encode(0, forKey:.rawValue)
        case .EQUIP:
            try container.encode(1, forKey:.rawValue)
        case .EVENT:
            try container.encode(2, forKey:.rawValue)
        }
    }
}
