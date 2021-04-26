import Foundation

//Взял стандартные примеры из урока, тк сейчас мало времени, а сдавать уже надо(
//Но сейчас пока перерыв между парами, буду все повторять, спасибо больше вам за уроки

struct Product {
    let name: String
}

struct Item {
    var price: Int
    var count: UInt
    var product: Product
}

enum VendingEroor: Error {
    case outOfStock //нет в наличии
    case invalidSelection //нет в ассортименте
    case insufficientFunds(coinsNeeded: Int) //нет денег
    
    var localizedDescription: String {
        switch self {
        case .outOfStock: return "Нет в наличии"
        case .invalidSelection: return "Нет в ассортименте"
        case .insufficientFunds(let coins): return "Недостаточно денег: \(coins)"
        }
    }
}

class VendMachine {
   private var inventory = [
        "Candy": Item(price: 20, count: 7, product: Product(name: "Candy")),
        "Chips": Item(price: 10, count: 8, product: Product(name: "Chips")),
        "Cola": Item(price: 25, count: 10, product: Product(name: "Cola"))
    ]
    var coinsDeposite = 0
    
    func vend(itemName name: String) -> (Product?, VendingEroor?) {
        
        guard let item = inventory[name] else {return (nil, .invalidSelection)}
        guard item.count > 0 else { return (nil, .outOfStock) }
        guard item.price <= coinsDeposite else{
            return (nil, .insufficientFunds(coinsNeeded: item.price - coinsDeposite)) }
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        coinsDeposite -= item.price
        
        return (item.product, nil)
    }
    
}

let vending = VendMachine()

let sale = vending.vend(itemName: "Cola")

/*if let product = sale.0 {
    print("We buy", product.name)
} else if let error = sale.1 {
    print(error.localizedDescription)
}
*/

extension VendMachine {
     
     func vendTry(itemName name: String) throws -> Product {
         
        guard let item = inventory[name] else {throw VendingEroor.invalidSelection}
        guard item.count > 0 else { throw VendingEroor.outOfStock }
        guard item.price <= coinsDeposite else{throw VendingEroor.insufficientFunds(coinsNeeded: item.price - coinsDeposite) }
         
         var newItem = item
         newItem.count -= 1
         inventory[name] = newItem
         
         coinsDeposite -= item.price
         
         return item.product
     }
     
 }

do {
    let product = try vending.vendTry(itemName: "Cola")
    print("We buy", product.name)
} catch VendingEroor.outOfStock {
    print(VendingEroor.outOfStock.localizedDescription)
}catch VendingEroor.invalidSelection{
    print(VendingEroor.invalidSelection.localizedDescription)
}catch VendingEroor.insufficientFunds(let coins){
    print(VendingEroor.insufficientFunds(coinsNeeded: coins).localizedDescription)
}
