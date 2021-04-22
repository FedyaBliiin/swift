import Foundation

struct People {
    var name: String
    var age: Int
}

struct queue <T> {
    
    private var elements:[T] = []
    
    mutating func push(element: T){
        elements.append(element)
    }
    
    mutating func ext() -> T? {
        guard elements.count > 0 else {return nil}
        return elements.removeLast()
    }
    
    func printQueue() {
        print(elements)
        print()
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var res = [T]()
        for i in elements {
            if predicate(i){
                res.append(i)
            }
        }
        return res
}

}

var stack = queue<People>()

stack.push(element: .init(name: "Fedor", age: 20))
stack.push(element: .init(name: "Ilya", age: 18))
stack.push(element: .init(name: "Mark", age: 22))
stack.push(element: .init(name: "Petr", age: 30))
stack.push(element: .init(name: "Lev", age: 45))

stack.printQueue()

let stack2 = stack.myFilter(predicate: {$0.age == 22})
print(stack2)
