/*
 class Person {
 let name: String
 init(name: String) {
 self.name = name
 print("\(name) is being initialized")
 }
 deinit {
 print("\(name) is being deinitialized")
 }
 }
 
 var reference1: Person?
 var reference2: Person?
 var reference3: Person?
 
 reference1 = Person(name: "John Appleseed")
 //John Appleseed is being initialized
 
 reference2 = reference1
 reference3 = reference1
 
 reference1 = nil
 reference2 = nil
 
 reference3 = nil
 // John Appleseed is being deinitialized
 
 */


/*
 class Person {
 let name: String
 init(name: String) { self.name = name }
 var apartment: Apartment?
 deinit { print("\(name) is being deinitialized") }
 }
 
 
 class Apartment {
 let unit: String
 init(unit: String) { self.unit = unit }
 var tenant: Person?
 deinit { print("Apartment \(unit) is being deinitialized") }
 }
 
 
 var john: Person?
 var unit4A: Apartment?
 
 john = Person(name: "John Appleseed")
 unit4A = Apartment(unit: "4A")
 
 john!.apartment = unit4A
 unit4A!.tenant = john
 john = nil
 unit4A = nil
 */
// The strong references between the Person instance and the Apartment instance remain and can’t be broken.

// To resolve it use weak references and unowned references.

// ARC automatically sets a weak reference to nil when the instance that it refers to is deallocated. And, because weak references need to allow their value to be changed to nil at runtime, they’re always declared as variables, rather than constants, of an optional type.

// MARK: -WEAK VAR

/*
 class Person {
 let name: String
 init(name: String) { self.name = name }
 var apartment: Apartment?
 deinit { print("\(name) is being deinitialized") }
 }
 class Apartment {
 let unit: String
 init(unit: String) { self.unit = unit }
 weak var tenant: Person?
 deinit { print("Apartment \(unit) is being deinitialized") }
 }
 
 var john: Person?
 var unit4A: Apartment?
 
 
 john = Person(name: "John Appleseed")
 unit4A = Apartment(unit: "4A")
 
 
 john!.apartment = unit4A
 unit4A!.tenant = john
 
 john = nil
 // Prints "John Appleseed is being deinitialized"
 
 unit4A = nil
 // Prints "Apartment 4A is being deinitialized"
 */


// MARK: -CLOSURES

/*
 { (parameters) -> return type in
 statements
 }
 
 

let array = [6,2,3,9,4,1]

func addOne (n1: Int) -> Int {
    return n1 + 1
}
array.map(addOne)



var newArray = array.map({ $0 + 1 })
print(newArray)

 */

// MARK: Fibonacci

func fibonacci(n: Int) {
    
    //Write your code here.
    var fibonacciArray: [Int] = [0,1]
    
    for i in 2...(n-1) {
        fibonacciArray.append(fibonacciArray[i-1] + fibonacciArray[i-2])
    }
    print(fibonacciArray)
}
fibonacci(n: 10)


