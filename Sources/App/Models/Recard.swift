//
//  File.swift
//  
//
//  Created by Guylian Bollon on 01/11/2020.
//

import Vapor

final class Recard:Content{
    static let schema = "Card"
    
    var id:UUID?
    var title:String
    var type:Type
    var manarequirements=[Mana:Int]()
    var life:Int
    var attack:Int
    var defense:Int
    var magicattack:Int
    var magicdefense:Int
    var mp:Int
    var magic=[Spell:Int]()
    var cost=[Mana:Int]()
    var specie:Spellspecies
    var generatedmana=[Mana:Int]()
    
    init(id:UUID?=nil,title:String,type:Type,manarequirements:[Mana:Int],life:Int,attack:Int,defense:Int,magicattack:Int,magicdefense:Int,mp:Int,magic:[Spell:Int],cost:[Mana:Int],specie:Spellspecies,generatedmana:[Mana:Int]){
        self.id=id
        self.title=title
        self.type=type
        self.manarequirements=manarequirements
        self.life=life
        self.attack=attack
        self.defense=defense
        self.magicattack=magicattack
        self.magicdefense=magicdefense
        self.mp=mp
        self.magic=magic
        self.cost=cost
        self.specie=specie
        self.generatedmana=generatedmana
    }
    private enum CodingKeys: String, CodingKey{
        case id
        case title
        case type
        case manarequirements
        case life
        case attack
        case defense
        case magicattack
        case magicdefense
        case magic
        case mp
        case cost
        case specie
        case generatedmana
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self,forKey:.title)
        type = try container.decode(Type.self, forKey:.type)
        manarequirements = try container.decode([Mana:Int].self,forKey:.manarequirements)
        life = try container.decode(Int.self,forKey:.life)
        attack = try container.decode(Int.self, forKey:.attack)
        defense = try container.decode(Int.self, forKey:.defense)
        magicattack = try container.decode(Int.self, forKey:.magicattack)
        magicdefense = try container.decode(Int.self, forKey:.magicdefense)
        mp = try container.decode(Int.self, forKey:.mp)
        magic = try container.decode([Spell:Int].self, forKey:.magic)
        cost = try container.decode([Mana:Int].self,forKey:.cost)
        specie = try container.decode(Spellspecies.self,forKey:.specie)
        generatedmana = try container.decode([Mana:Int].self,forKey:.generatedmana)
    }
}

enum Type{
    case Monster
    case Magic
    case Source
}
extension Type:Codable{
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
            self = .Monster
        case 1:
            self = .Magic
        case 2:
            self = .Source
        default:
            throw CodingError.unknownValue
        }
    }
    func encode(to encoder:Encoder) throws{
        var container = encoder.container(keyedBy: Key.self)
        switch self{
        case .Monster:
            try container.encode(0, forKey:.rawValue)
        case .Magic:
            try container.encode(1, forKey:.rawValue)
        case .Source:
            try container.encode(2, forKey:.rawValue)
        }
    }
}
