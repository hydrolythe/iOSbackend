import Vapor

func routes(_ app: Application) throws {
    var list = [Recard]()
    
    app.post("card"){ req -> Recard in
        let card = try req.content.decode(Recard.self)
        list.append(card)
        return card
    }
    app.get("card"){ req -> [Recard] in
        return list
    }
    app.delete("card"){ req -> Recard in
        let card = try req.content.decode(Recard.self)
        list = list.filter({(recard:Recard) -> Bool in
            recard.title != card.title
        })
        return card
    }
}
