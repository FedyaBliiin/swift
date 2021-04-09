import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.


enum Engine:String{
    case on="Двигатель включен"
    case off="Двигатель выключен"
}

enum Windows:String{
    case open="Открыты"
    case close="Закрыты"
}

enum volumeTrunk:String{
    case full="Багажник полон"
    case half="Багажник заполнен на половину"
    case empty="Багажник пуст"
}

enum volumeBody:String{
    case full="Кузов полон"
    case half="Кузов заполнен на половину"
    case empty="Кузов пуст"
}

enum Quality:String{
    case exelent="Машина в отличном состоянии"
    case good="Машина в хорошем состоянии"
    case notyet="Машине в среднем состоянии"
    case bad="Машина в плохом состоянии"
}


struct SportCar{
    let mark:String
    let year:Int
    let volume:Int
    let engine:Engine
    let windows:Windows
    let volumetrunk:volumeTrunk
    var km:Double {
        willSet {
            print("Сейчас пробег \(km), а будет \(newValue)")
        }
        didSet{
            print("Пробег = \(km)")
        }
    }
    var quality:Quality{
        if (km<10)
        {
            return .exelent
        }
        if(km>10) && (km<50)
        {
            return .good
        }
        if (km>50) && (km<100)
        {
            return .notyet
        }
        else{
            return .bad
        }
    }
}

struct TrunkCar{
    let mark:String
    let year:Int
    let volume:Int
    let engine:Engine
    let windows:Windows
    let volumeBody:volumeBody
    var km:Double {
        willSet {
            print("Сейчас пробег \(km), а будет \(newValue)")
        }
        didSet{
            print("Пробег = \(km)")
        }
    }
    var quality:Quality{
        if (km<10)
        {
            return .exelent
        }
        if(km>10) && (km<50)
        {
            return .good
        }
        if (km>50) && (km<100)
        {
            return .notyet
        }
        else{
            return .bad
        }
    }
}

func printCar(_ car:SportCar){
    print("Марка - \(car.mark)")
    print("Год выпуска - \(car.year)")
    print("Объем багажника - \(car.volume)")
    print("Состояние двигателя - \(car.engine.rawValue)")
    print("Окна \(car.windows.rawValue)")
    print("Заполненность багажника - \(car.volumetrunk.rawValue)")
    print("Пробег - \(car.km)")
}
func printTrunk(_ car:TrunkCar){
    print("Марка - \(car.mark)")
    print("Год выпуска - \(car.year)")
    print("Объем багажника - \(car.volume)")
    print("Состояние двигателя - \(car.engine.rawValue)")
    print("Окна \(car.windows.rawValue)")
    print("Заполненность кузова - \(car.volumeBody.rawValue)")
    print("Пробег - \(car.km)")
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

var car=SportCar(mark: "Audi", year: 2002, volume: 200, engine: .on, windows: .open, volumetrunk: .half, km: 45)

var trunk=TrunkCar(mark: "VAZ", year: 2006, volume: 12, engine: .off, windows: .open, volumeBody:.empty, km: 0)

var trunk2=TrunkCar(mark: "VAZ", year: 2006, volume: 12, engine: .off, windows: .open, volumeBody:.empty, km: 20)

//6. Вывести значения свойств экземпляров в консоль. 

printCar(car)

car.km=60

printTrunk(trunk)

printTrunk(trunk2)

trunk2.km=120
