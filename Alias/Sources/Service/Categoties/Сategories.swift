import Foundation

struct Category {
    
    let title: String
    let words: [String]
    
    private var usedIndexes = [Int]()
    
    mutating private func getIndex() -> Int {
        
        var newIndex = 0
        
        if usedIndexes.count == words.count {
            self.usedIndexes = []
        }
        
        repeat {
            newIndex = Int.random(in: 0...words.count - 1)
        } while !usedIndexes.contains(newIndex)
        
        self.usedIndexes.append(newIndex)
        
        return newIndex
    }
    
    mutating func getWord() -> String {
        
        let index = getIndex()
        
        return words[index]
    }
}

extension Category {
    
    static let categories: [Category] =  [
        Category(title: "Музыка",
        words: ["музыка", "песня", "клип", "компакт-диск", "гитара", "струна", "нота", "голос", "композиция", "аккомпонимент", "дерижер", "оркестр", "консерватория", "камертон", "музыковед", "кселофон", "медиатор"]),
    
        Category(title: "Сладости",
        words: ["шоколад", "каромель", "вафля", "фантик", "бомбоньерка", "трюфель", "патока", "какао-боб", "ореховая масса", "кондитерская", "шоколадье", "пролене", "глазурь", "фандю"]),
    
        Category(title: "Транспорт",
        words: ["машина", "самокат", "колесо", "поршень", "мотор", "пассажир", "машинист", "электропоезд", "центральное кольцо", "ремень безопасности", "автовокзал", "патруль", "светофор", "автомастерская", "механик"]),
    
        Category(title: "Спорт",
        words: ["нападающий", "болельщик", "тренер", "гонтеля", "ракетка", "арена", "чемпионат", "тайм-аут", "супервайзер", "гимнаст", "бутцы", "раунд", "бейсболл", "спортивная ходьба", "сноуборд"])
    ]
}
