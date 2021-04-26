

import Foundation

enum Door:String{
    case open = "открыты"
    case close = "закрыты"
}

enum quantityDoor:String{
    case four = "четыре"
    case wo = "две"
}

enum QualityCar:String{
    case good = "хорошее"
    case bad = "плохое"
}

class sportCar{
    var color: String
    var mp3: Bool
    let door: Door
    var km: Double
    var quality: QualityCar
    {
        if km>10 {
            return .bad
        }
        else{
            return .good
        }
    }
    
    init(color: String, mp3: Bool, door: Door, km: Double) {
        self.color = color
        self.mp3 = mp3
        self.door = door
        self.km = km
    }
    
    func printall(){
        print("Цвет - \(self.color)")
        print("Музыка - \(self.mp3)")
        print("Двери - \(self.door.rawValue)")
        print("Качество авто - \(self.quality.rawValue)")
    }
}

var car = sportCar(color: "white", mp3: true, door: .close, km: 10)

car.printall()
print()

class inheritCar: sportCar{
    var qdoor:quantityDoor
    
    init(color: String, mp3: Bool, door: Door,km: Double, qdoor: quantityDoor){
        self.qdoor = qdoor
        super.init(color: color, mp3: mp3, door: door, km: km)
    }
    override func printall(){
        print("Цвет - \(self.color)")
        print("Музыка - \(self.mp3)")
        print("Двери - \(self.door.rawValue)")
        print("Качество авто - \(self.quality.rawValue)")
        print("Количество дверей - \(self.qdoor.rawValue)")
    }
}

var car2 = inheritCar(color: "White", mp3: false, door: .close,km: 1, qdoor: .four)

car2.printall()
print()

car2.km = 20

car2.printall()

print("__________________________________")
print()

enum quantityWheels:String{
    case six = "шесть"
    case eight = "восемь"
}

class trunkCar{
    var color: String
    var mp3: Bool
    let door: Door
    var km: Double
    var wheels: quantityWheels
    var quality: QualityCar
    {
        if km>10 {
            return .bad
        }
        else{
            return .good
        }
    }
    
    init(color: String, mp3: Bool, door: Door, km: Double, wheels: quantityWheels) {
        self.color = color
        self.mp3 = mp3
        self.door = door
        self.km = km
        self.wheels = wheels
    }
    
    func printall(){
        print("Цвет - \(self.color)")
        print("Музыка - \(self.mp3)")
        print("Двери - \(self.door.rawValue)")
        print("Качество авто - \(self.quality.rawValue)")
        print("Количество колес - \(self.wheels.rawValue)")
    }
}

var trunk = trunkCar(color: "white", mp3: true, door: .close, km: 10, wheels: .eight)

trunk.printall()
print()

class inheritTrunk: trunkCar{
    var qdoor:quantityDoor
    
    init(color: String, mp3: Bool, door: Door,km: Double, wheels: quantityWheels, qdoor: quantityDoor){
        self.qdoor = qdoor
        super.init(color: color, mp3: mp3, door: door, km: km, wheels: wheels)
    }
    override func printall(){
        print("Цвет - \(self.color)")
        print("Музыка - \(self.mp3)")
        print("Двери - \(self.door.rawValue)")
        print("Качество авто - \(self.quality.rawValue)")
        print("Количество колес - \(self.wheels.rawValue)")
        print("Количество дверей - \(self.qdoor.rawValue)")
    }
}

var trunk2 = inheritTrunk(color: "White", mp3: false, door: .close,km: 1, wheels: .six, qdoor: .four)

trunk2.printall()
print()

trunk2.km = 15

trunk2.printall()
