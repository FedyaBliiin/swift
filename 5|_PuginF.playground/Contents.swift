import Foundation

enum Door:String{
    case open = "открыты"
    case close = "закрыты"
}

enum Engine:String{
    case on = "включен"
    case off = "выключен"
}

enum Windows:String{
    case open = "открыты"
    case close = "закрыты"
}

enum Roof:String{
    case with = "с крышей"
    case without = "без крыши"
}

enum TruckIsEmpty:String{
    case full = "заполнен"
    case notyet = "заполнен на половину"
    case empty = "пустой"
}

protocol CarProtocol: class{
    var name: String {get}
    var color: String {get}
    var doorState: Door {get set}
    var engineState: Engine {get set}
    var windowsState: Windows{get set}
}

extension CarProtocol{
    func ChangeEngine(engineState: Engine)
    {
        self.engineState = engineState
    }
    func ChangeWindows(windowsState:Windows)
    {
        self.windowsState = windowsState
    }
}

class BasedCar: CarProtocol{
    var name: String
    var color: String
    var doorState: Door
    var engineState: Engine
    var windowsState: Windows
    
    init(name: String, color: String, doorState: Door, engineState: Engine, windowsState: Windows)
    {
        self.name = name
        self.color = color
        self.doorState = doorState
        self.engineState = engineState
        self.windowsState = windowsState
    }
 
    func printCar(){
        print("Бренд - \(name)")
        print("Цвет - \(color)")
        print("Двери - \(doorState.rawValue)")
        print("Двигатель - \(engineState.rawValue)")
        print("Окна - \(windowsState.rawValue)")
    }
}

class sportCar: BasedCar, CustomStringConvertible{
    var roof: Roof = .with
    var description: String{
        return "roof - \(roof.rawValue)"
    }
}

class trunkCar: BasedCar, CustomStringConvertible{
    var trunk: TruckIsEmpty = .empty
    var description: String{
        return "roof - \(trunk.rawValue)"
    }
}


var mazda = sportCar(name: "Mazda", color: "white", doorState: .close, engineState: .off, windowsState: .open)
var gazel = trunkCar(name: "Gazel", color: "black", doorState: .open, engineState: .off, windowsState: .close)
mazda.printCar()
print("----------------------")
gazel.printCar()

mazda.ChangeEngine(engineState: .on)
mazda.roof = .without
gazel.ChangeWindows(windowsState: .open)
gazel.trunk = .notyet

print()

mazda.printCar()
print("----------------------")
gazel.printCar()
