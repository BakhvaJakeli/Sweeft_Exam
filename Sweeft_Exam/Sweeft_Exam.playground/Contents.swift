import UIKit

//1
func isPalindrome(_ text:String) -> Bool {
    let characters = Array(text)
    for i in 0..<characters.count / 2 {
        if characters[i] != characters[characters.count - 1 - i] {
            return false
        }
    }
    return true
}

//2
func minSplit(_ ammount:Int) -> Int {

    guard ammount >= 0 else {return -1}
    
    let currency = [50,20,10,5,1]
    let n = currency.count
    var initilAmmount = ammount
    var answer: [Int] = []
    
    for i in 0..<n {
        while (initilAmmount >= currency[i]) && initilAmmount > 0 {
            initilAmmount -= currency[i]
            answer.append(currency[i])
        }
    }
    return answer.count
}

//3
func notContains(_ array: [Int]) -> Int {
    let mySet: Set<Int> = .init(array)
    for i in 0..<mySet.count {
        if !mySet.contains(i + 1) {
            return i + 1
        }
    }
    return mySet.count + 1
}

//4
struct Stack {
    private var items:[String] = []
    
    mutating func pop() -> String {
        return items.removeFirst()
    }
    mutating func push (_ element:String) {
        items.insert(element, at: 0)
    }
    func size() -> Int {
        return items.count
    }
}

func isProperly(_ sequence:String) -> Bool {
    var stack = Stack()
    for i in sequence {
        if i == "(" {
            stack.push( String(i))
        } else if i == ")" && stack.size() == 0 {
            return false
        } else {
            stack.pop()
        }
    }
    return stack.size() == 0
}

//5
func countVariants(_ numberOfStairs: Int) -> Int{
    guard numberOfStairs >= 0 else {return -1}
    
    if numberOfStairs == 1 || numberOfStairs == 0 || numberOfStairs == 2 {
        return numberOfStairs
    }
    return countVariants(numberOfStairs - 1) + countVariants(numberOfStairs - 2)
}

//6
struct customStack <T> {
    
    private var myArray = [T]()
    
    init(_ initialValue: [T] = []) {
        self.myArray = initialValue
    }
    mutating func push(_ value: T) {
        myArray.append(value)
    }
    
    @discardableResult mutating func pop() -> T? {
        return myArray.popLast()
    }
    
    func printAllValues() {
        print(myArray)
    }
}

