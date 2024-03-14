import UIKit
import RegexBuilder

var greeting = "Hello, playground"

2 + 6
2 + 6
2 + 6
2 + 6

1 << 4

32 >> 2

let age1 = 42
let age2 = 21

let avg = (age1 + age2) / 2

let tuple = (day: 15, month: 8, year: 2015)
let day = tuple.day



var sum = 1

while true {
    sum = sum + (sum + 1)
    if sum >= 1000 {
        break
    }
}


//// Arrays
// for repeating propouses
let allZeros = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]

var players = ["Alice", "Bob", "Cindy", "Dan"]
let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2])
print(upcomingPlayersSlice)
players.append("Eli")
players += ["Gina"]
print(players)
players.insert("Frank", at: 5)
print(players)




var bobData = [
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"
print(bobData)
bobData.updateValue("Bobby", forKey: "name")
bobData["profession"] = "Mailman"
print(bobData)


var multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

let result = multiplyClosure(4, 2)

let name: String = "Eder"
let voidClosure: () -> Void = {
    print("Swift Apprentice is awesome! \(name)")
}
voidClosure()

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
print(counter)

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}
var prices = [1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
    $0 > 5
}
print(largePrices)

let userInput = ["0", "11", "haha", "42"]

let numbers1 = userInput.map {
    Int($0)
}

print(numbers1)

let numbers2 = userInput.compactMap {
    Int($0)
}

print(numbers2)

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let allUserInput = userInputNested.flatMap {
    $0
}
print(allUserInput)
let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) {
    (result, this: (key: String, value: Int)) in
    for _ in 0 ..< this.value {
        result.append(this.key)
    }
}
print(allAnimals)

let removeFirst = prices.dropFirst()
print(removeFirst)
let removeFirstTwo = prices.dropFirst(2)
print(removeFirstTwo)
print(prices.removeAll() { $0 > 2 })


func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }
    
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }
    
    return true
}

let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)

primes.forEach { print($0) }


let multiRaw = #"""
  _____         _  __ _
 / ____|       (_)/ _| |
| (_____      ___| |_| |_
 \___ \ \ /\ / / |  _| __|
 ____) \ V  V /| | | | |_
|_____/ \_/\_/ |_|_|  \__|
"""#
print(multiRaw)
let searchString = "john"
let searchExpression = /john/
let stringToSearch = "Johnny Appleseed wants to change his name to John."

stringToSearch.contains(searchString) // false
stringToSearch.contains(searchExpression) // false
let flexibleExpression = /[Jj]ohn/
stringToSearch.contains(flexibleExpression) // true
let lettersAndNumbers = /[a-z]+[0-9]+/
let testingString1 = "abcdef ABCDEF 12345 abc123 ABC 123 123ABC 123abc abcABC"
for match in testingString1.matches(of: lettersAndNumbers) {
    print(String(match.output))
}
let possibleLettersAndPossibleNumbers = /[a-z]*[0-9]*/
var count = 0
/*for match in testingString1.matches(of: possibleLettersAndPossibleNumbers) {
 count += 1
 print(String(match.output))
 print(count.description)
 }*/

let fixedPossibleLettersAndPossibleNumbers = /[a-z]+[0-9]*|[a-z]*[0-9]+/
for match in testingString1.matches(of: fixedPossibleLettersAndPossibleNumbers) {
    print("🚀\(String(match.output))")
}

let newlettersAndNumbers = Regex {
    OneOrMore { "a"..."z" }
    OneOrMore { .digit }
}

let newFixedRegex = Regex {
    Anchor.wordBoundary
    ChoiceOf {
        Regex {
            OneOrMore {
                "a"..."z"
            }
            ZeroOrMore {
                .digit
            }
        }
        Regex {
            ZeroOrMore {
                "a"..."z"
            }
            OneOrMore {
                .digit
            }
        }
    }
    Anchor.wordBoundary
}

let regexWithCapture = Regex {
    OneOrMore {
        "a"..."z"
    }
    Capture {
        OneOrMore {
            CharacterClass.digit
        }
    }
    OneOrMore {
        "a"..."z"
    }
}

let testingString2 = "welc0me to chap7er 10 in sw1ft appren71ce. " +
"Th1s chap7er c0vers regu1ar express1ons and regexbu1lder"

for match in testingString2.matches(of: regexWithCapture) {
    let (wordMatch, extractedDigit) = match.output
    print("Full Match: \(wordMatch) | Captured value: \(extractedDigit)")
}

let regexWithStrongType = Regex {
    OneOrMore {
        "a"..."z"
    }
    TryCapture {
        OneOrMore {
            CharacterClass.digit
        }
    } transform: {foundDigits in
        Int(foundDigits)
    }
    OneOrMore {
        "a"..."z"
    }
}

struct Contact {
    var fullName: String
    var emailAddress: String
    var relationship = "Friend"
}

var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")


// Computed properties

struct TV {
    var height: Double
    var width: Double
    
    // 1
    var diagonal: Int {
        // 2
        let result = (height * height +
                      width * width).squareRoot().rounded()
        // 3
        return Int(result)
    }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal // 110
tv.width = tv.height
tv.diagonal // 76

struct TV2 {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        // 1
        get {
            // 2
            let result = (height * height +
                          width * width).squareRoot().rounded()
            return Int(result)
        }
        set {
            // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            let ratioDiagonal = (ratioWidth * ratioWidth +
                                 ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}
var tv2 = TV2(height: 53.93, width: 95.87)

tv2.diagonal = 70
tv2.height // 34.32...
tv2.width // 61.01...

struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

struct MyStruct {
    var myProperty: Int {
        willSet(newVal) {
            print("La propiedad está a punto de cambiar de \(myProperty) a \(newVal)")
        }
        didSet(oldVal) {
            print("La propiedad acaba de cambiar de \(oldVal) a \(myProperty)")
        }
    }
}

var myInstance = MyStruct(myProperty: 5)
myInstance.myProperty = 10

struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
    var radius = 0.0
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5)
circle.circumference // 31.42

struct LazyExample {
    var value: Int = 0
    lazy var lazyValue: Int = {
        print("Calculando lazyValue basado en value")
        return value * 2
    }()
}

var example = LazyExample()
example.value = 10

// La primera vez que accedemos a lazyValue, se calcula y se imprime "Calculando lazyValue basado en value".
print(example.lazyValue) // Imprime 0 porque la inicialización lazy se hizo cuando value era 0.

// Cambiamos el valor de 'value' después de que 'lazyValue' ha sido inicializado.
example.value = 20

// Acceder a lazyValue nuevamente no recalcula su valor; simplemente devuelve el valor calculado anteriormente.
print(example.lazyValue) // Sigue imprimiendo 0, no 40.

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue // 25

let aSmallCoin = Coin.dime
coin.rawValue > aSmallCoin.rawValue   //true

aSmallCoin.rawValue + coin.rawValue   //35

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

var balance = 100

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money!")
    }
}

let resultWithdraw = withdraw(amount: 99)

switch resultWithdraw {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}

let resultWithdraw2 = withdraw(amount: 1000)

switch resultWithdraw2 {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}

enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there")
guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)

let optionalNil: Int? = .none
optionalNil == nil    // true
optionalNil == .none  // true

protocol Vehicle {
    /// Return a description of the state of the vehicle.
    func describe() -> String
    /// Increases speed until it reaches its maximum speed.
    mutating func accelerate()
    
    /// Stop moving. Reducing the speed to zero miles per hour.
    mutating func stop()
    
    /// The speed of the vehicle in miles per hour.
    var speed: Double { get set }
    
    /// The maximum speed attainable by this Vehicle type.
    static var maxSpeed: Double { get }
    
    // more to come...
}

class Unicycle: Vehicle {
    func describe() -> String {
        "Unicycle @ \(speed) mph"
    }
    func accelerate() {
        speed = min(speed + 2, Self.maxSpeed)
    }
    func stop() {
        speed = 0
    }
    var speed: Double = 0
    static var maxSpeed: Double { 15 }
}

struct Car {
    func describe() -> String {
        "Car @ \(speed) mph"
    }
    mutating func accelerate() {
        speed = min(speed + 20, Self.maxSpeed)
    }
    mutating func stop() {
        speed = 0
    }
    var speed: Double = 0
    static var maxSpeed: Double { 150 }
}

extension Car: Vehicle {}

extension Vehicle {
    mutating func stop() {
        speed = 0
    }
}

extension Vehicle {
    /// Return the speed as a value between 0-1.
    var normalizedSpeed: Double {
        speed / Self.maxSpeed
    }
}

/// Different pressure options.
enum BrakePressure {
    case light
    case normal
    case hard
}

protocol Braking {
    /// Apply the brakes.
    mutating func brake(_ pressure: BrakePressure)
}

extension Braking {
    /// Apply normal brakes.
    mutating func brake() {
        brake(.normal)
    }
}

protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    
    var value: Double = 0.0
    
    required init(initialAmount: Double) {
        value = initialAmount
    }
    
    required init?(transferAccount: any Account) {
        guard transferAccount.value > 0.0 else { return nil }
        value = transferAccount.value
    }
}

let accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30)
let transferAccount = accountType.init(transferAccount: account)!

protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get }
}

extension Unicycle: WheeledVehicle {
    var numberOfWheels: Int {
        1
    }
    
    var wheelSize: Double {
        20.0
    }
}

protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}

var named: Named = ClassyName(name: "Classy")
var copy = named

named.name = "Still Classy"
named.name // Still Classy
copy.name  // Still Classy

named = StructyName(name: "Structy")
copy = named

named.name = "Still Structy?"
named.name // Still Structy?
copy.name  // Structy

var randomDict: [Int: Bool] = [:]

for i in 1...100 {
    randomDict[i] = Bool.random()
}

func printTrueKeys() {
    for (key, value) in randomDict where value {
        print(key)
    }
}

printTrueKeys()

class Student {
    let email: String
    let firstName: String
    let lastName: String
    
    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: Hashable {
    static func ==(lhs: Student, rhs: Student) -> Bool {
        lhs.email == rhs.email &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
}

let john = Student(email: "johnny.appleseed@apple.com",
                   firstName: "Johnny",
                   lastName: "Appleseed")
let lockerMap = [john: "14B"]

extension Student: Identifiable {
    var id: String {
        email
    }
}
extension Student: CustomStringConvertible {
    var description: String {
        """
🚀
\(firstName)
 \(lastName)
🚀
"""
    }
}
print(john)

extension Double {
    func truncatedToOneDecimal() -> Double {
        floor(self * 10) / 10
    }
}

let tests: [Double] = [
    10.0,
    0.23434234234234,
    0.23,
    0.9,
    123131231.23333,
    123131231.23,
    -12.34,
    -123.5623234
]

for test in tests {
    print(test.truncatedToOneDecimal())
}

protocol Pet {
    var name: String { get }  // all pets respond to a name
}

class Cat: Pet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Pet {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

/*class Keeper<Animal> {
 var name: String
 var morningCare: Animal
 var afternoonCare: Animal
 
 init(name: String, morningCare: Animal, afternoonCare: Animal) {
 self.name = name
 self.morningCare = morningCare
 self.afternoonCare = afternoonCare
 }
 }*/
class Keeper<Animal: Pet> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}


let jason = Keeper(name: "Jason",
                   morningCare: Cat(name: "Whiskers"),
                   afternoonCare: Cat(name: "Sleepy"))
//let jsbdf = Keeper(name: "asdasd", morningCare: Dog(name: "asdasd"), afternoonCare: Cat(name: "dafasd"))

func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    (y, x)
}

swapped(33, 23)  // returns ("Jay", 33)

/*func callForDinner<Animal: Pet>(_ pet: Animal) {
 print("Here \(pet.name)-\(pet.name)! Dinner time!")
 }*/

func callForDinner(_ pet: some Pet) {
    print("Here \(pet.name)-\(pet.name)! Dinner time!")
}
callForDinner(Dog(name: "dogo"))

extension Array where Element: Cat {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

protocol Meowable {
    func meow()
}

extension Cat: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

extension Array: Meowable where Element: Meowable {
    func meow() {
        forEach { $0.meow() }
    }
}

let lost: [any Pet] = [Cat(name: "Whiskers"), Dog(name: "Hachiko")]

/// Return a lost Cat.
/*func findLostCat(name: String) -> Cat? {
 lost.lazy.compactMap {
 $0 as? Cat
 }.first {
 $0.name == name
 }
 }
 
 /// Return a lost Cat.
 func findLostDog(name: String) -> Dog? {
 lost.lazy.compactMap { dog in
 dog as? Dog
 }.first { dog in
 dog.name == name
 }
 }*/

func findLostPet(name: String) -> (any Pet)? {
    lost.first { $0.name == name}
}


func findLost<Animal: Pet>(_ petType: Animal.Type, name: String) -> (some Pet)? {
    lost.lazy.compactMap {
        $0 as? Animal
    }.first {
        $0.name == name
    }
}

func findLostName<Animal: Pet>(_ petType: Animal.Type, name: String) -> String? {
    let animal = lost.lazy.compactMap {
        $0 as? Animal
    }.first {
        $0.name == name
    }
    return animal?.name
}

findLost(Cat.self, name: "Whiskers")
findLost(Dog.self, name: "Hachiko")

findLostName(Cat.self, name: "Whiskers")
findLostName(Dog.self, name: "Hachiko")

func findLostMeow<Animal: Pet>(_ petType: Animal.Type, name: String) -> Animal? {
    lost.lazy.compactMap {
        $0 as? Animal
    }.first {
        $0.name == name
    }
}

findLostMeow(Cat.self, name: "Whiskers")?.meow()

enum OptionalDate {
    case none
    case some(Date)
}

enum OptionalString {
    case none
    case some(String)
}

struct FormResults {
    // other properties here
    var birthday: OptionalDate
    var lastName: OptionalString
}

enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
