//
//  File.swift
//  
//
//  Created by Guylian Bollon on 29/10/2020.
//

import Vapor
enum Mana{
    case APEIRON
    case ATOM
    case FORM
    case TIME
    case SOUL
    case VOID
}
extension Mana:Codable{
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
            self = .APEIRON
        case 1:
            self = .ATOM
        case 2:
            self = .FORM
        case 3:
            self = .TIME
        case 4:
            self = .SOUL
        case 5:
            self = .VOID
        default:
            throw CodingError.unknownValue
        }
    }
    func encode(to encoder:Encoder) throws{
        var container = encoder.container(keyedBy: Key.self)
        switch self{
        case .APEIRON:
            try container.encode(0, forKey:.rawValue)
        case .ATOM:
            try container.encode(1, forKey:.rawValue)
        case .FORM:
            try container.encode(2, forKey: .rawValue)
        case .TIME:
            try container.encode(3, forKey: .rawValue)
        case .SOUL:
            try container.encode(4, forKey: .rawValue)
        case .VOID:
            try container.encode(5, forKey: .rawValue)
        }
    }
}
