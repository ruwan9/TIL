# Swift

> Safe, Fast, Expressive

**Safe (안정성)**

: 안전한 프로그래밍 지향

- 옵셔널, guard 구문, 타입 통제 등을 통해 안전한 프로그래밍 구현

**Fast (신속성)**

: C 언어 수준과 동등한 성능을 일정한 수준으로 유지하는 데 초점

**Expressive (더 나은 표현성)**

: 편하고 보기 좋은 문법 구현



**다중 패러다임 프로그래밍 언어**

: 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임

- 명령형과 객체지향 프로그래밍 패러다임을 기반으로 한 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임을 지향



## String Interpolation

: 변수 또는 상수 등의 값을 문자열에 나타내고 싶을 때 사용

- 문자열 내에 `\(변수나 상수)` 형태로 표기한다.

```swift
let name: String = "Taylor"
print("My name is \(name)")  // My name is Taylor
```



## 변수와 상수

값이 바뀔수 있는 변수보다, 상수를 이용하는 것이 더 안전해서, 상수 사용을 권장함

### 변수 (Variables)

: 생성 후 데이터 값을 변경할 수 있다.

- `var` 키워드로 선언한다.

```swift
var [변수명]: [데이터 타입] = [값]  // Type Annotation
```



### 상수 (Constants)

: 생성 후 데이터 값을 변경할 수 없다.

- `let` 키워드로 선언한다.

```swift
let [상수명]: [데이터 타입] = [값]
```



## 데이터 타입

: 프로그램 내에서 다루어지는 데이터의 종류

- 스위프트의 기본 데이터 타입은 모두 `구조체`를 기반으로 구현됨
- 모든 데이터 타입 이름은 대문자 카멜케이스 사용



### Int와 UInt

- **Int**
  - +, - 부호를 포함한 정수

- **UInt**
  -  부호가 없는 양의 정수 (0 포함)



### Bool

- true 또는 false만 값으로 가짐



### Float와 Double

- **Double**

  - 64비트 부동소수 표현

  - 15~16자리 정확도 보장

- **Float**

  - 32비트 부동소수 표현

  - 7~8자리 정확도 보장



### Character

- 문자 (단어나 문장처럼 문자의 집합이 아닌 단 하나의 문자를 의미)



### String

- 문자열 (문자의 나열)

```swift
// 문자열 생성
let name: String = "Taylor"

// 이니셜라이저를 사용, 빈 문자열 생성
var introduce: String = String()

// append() 메서드를 사용, 문자열 이어붙이기
introduce.append("저의 이름은")

// + 연산자를 사용, 문자열 이어붙이기
introduce = introduce + " " + name + "입니다."

print(introduce)  // 저의 이름은 Taylor 입니다.

// 문자열 수 세기
name.count  // 6

// 빈 문자열인지 확인
name.isEmpty  // false
```



### Any, AnyObject와 nil

**Any**

: 스위프트의 모든 데이터 타입을 사용할 수 있다는 뜻

**AnyObject**

: 클래스의 인스턴스만 할당 가능

**nil**

: 특정 타입이 아니라 `없음` 을 나타내는 키워드

- 변수 또는 상수 값이 들어있지 않고 `비어있음`을 나타낼 때 사용
- 변수 또는 상수 값이 nil이면 해당 변수 또는 상수에 접근했을 때 런타임 오류 발생(잘못된 메모리 접근)



### 타입 추론

: 변수나 상수를 선언할 때 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정한다.

```swift
// 타입을 지정하지 않았으나 타입 추론을 통해 name은 String 타입으로 선언
var name = "Taylor"
```



### 튜플

: 지정된 데이터의 묶음 (프로그래머 마음대로 만드는 타입)

```swift
// String, Int, Double 타입을 갖는 튜플
var person: (name: String, age: Int, height: Double) = ("Taylor", 31, 180.0)
print("이름: \(person.name), 나이: \(person.age), 키: \(person.height)")

// 인덱스를 이용해 값을 빼올 수도 있다.
print("이름: \(person.0), 나이: \(person.1), 키: \(person.2)")
```



### 배열 (Array)

: 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입

- 각 요소에 인덱스를 통해 접근 가능 (인덱스는 0부터 시작)
- 맨 처음과 마지막 요소는 first와 last 프로퍼티를 통해 가져올 수 있다.
- `index(of:)` 메서드를 사용, 해당 요소의 인덱스를 알 수 있다.
- `insert(_:at:)` 메서드를 사용, 중간에 요소를 삽입할 수 있다.

```swift
// 배열 선언 1
var names: Array<String> = ["alpha", "beta", "gamma", "delta"]

// 배열 선언 2 ([String]은 Array<String>의 축약 표현)
var names: [String] = ["alpha", "beta", "gamma", "delta"]


// 빈 배열 선언 1
var emptyArray: [Any] = [Any]()

// 빈 배열 선언 2
var emptyArray: [Any] = Array<Any>()

// 배열 타입을 명시해줬다면 []만으로도 빈 배열을 생성할 수 있다.
var emptyArray: [String] = []
emptyArray.isEmpty  // true
```



### 딕셔너리 (Dictionary)

: 요소들이 순서 없이 key와 value의 쌍으로 구성되는 컬렉션 타입

- 하나의 딕셔너리 안의 key는 같은 이름을 중복해 사용할 수 없다. (key는 value를 대변하는 유일한 식별자)
- key는 유일하며, value는 유일하지 않다.
- 내부에 없는 key로 접근하면 `nil` 반환
- removeValue(forKey:) 메서드를 사용, 특정 키에 해당하는 값을 제거

```swift
// 딕셔너리 선언
var numberForName: [String: Int] = ["Taylor":30, "Swift": 50]
numberForName.count  // 2


// 빈 딕셔너리 선언 1
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

// 빈 딕셔너리 선언 2.
var numberForName: [String: Int] = [String: Int]()

// 딕셔너리의 key와 value 타입을 명시해줬다면 [:]만으로도 빈 딕셔너리를 생성할 수 있다.
var numberForName: [String: Int] = [:]
```



### 세트 (Set)

: 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입

- 중복된 값이 존재하지 않는다.
- 순서가 중요하지 않거나, 각 요소가 유일한 값이어야 하는 경우 사용
- insert(_:) 메서드를 사용, 요소를 추가
- remove(_:) 메서드를 사용, 요소를 삭제

```swift
// 세트 선언 - 축약형은 없다.
var names: Set<String> = ["alpha", "beta", "gamma", "alpha"]

// alpha가 중복되기 때문에 count는 3
names.count  // 3


// 빈 세트 선언 1.
var names: Set<String> = Set<String>()

// 빈 세트 선언 2.
var names: Set<String> = []
```



### 열거형 (Enum)

: 연관된 항목을 묶어서 표현할 수 있는 타입 (그룹 정의)

- 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가
- 스위프트의 열거형은 각 열거형이 고유의 타입으로 인정
- 옵셔널은 열거형으로 구현됨

```swift
enum WeekDay {
    case mon
    case tue
    case wed
    case thu
    case fri
}

var today: WeekDay = .mon // mon
```

- 연관값(associated value)을 가지고 있는 형태로 표현 가능

```swift
enum MediaType {
    case audio(String)
    case video(String)
}

var mp3: MediaType = .audio("mp3") // audio("mp3")
var h264: MediaType = .video("h264") // video("h264")
```





## 조건문과 반복문

### 조건을 검사할 때, `if`, `switch` 를 사용



- `if` 을 이용한 조건 검사

```swift
let age = 10

// if 문의 조건절에는 boolean 타입을 사용 
// 예) age > 20 
if age > 20 {
    print("성인 입니다")
} else {
    print("미성년 입니다")
}

// else-if 조건을 이용해서, 조건을 세분화 
if age >= 10 && age < 20 {
    print("10대 입니다")
} else if age >= 20 && age < 30 {
    print("20대 입니다")
} else if age >= 30 && age < 40 {
    print("30대 입니다")
} else if age >= 40 && age < 50 {
    print("40대 입니다")
} else {
    print("......")
}
```



- `switch` 를 이용한 조건 검사

```swift
enum Weather {
    case sun
    case cloud
    case rain
}

var weather: Weather = .sun // sun

switch weather {
case .sun:
    print("맑아요")
case .cloud:
    print("흐려요")
case .rain:
    print("비와요")
}
```



### 반복되는 연산을 할때는 `for`, `while` 을 사용

배열과 딕셔너리의 아이템을 순차적으로 체크할 때 사용 가능

```swift
let ages = [3, 20, 60]
let languageCode = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja",
]

for age in ages {
    print("age: \\(age)")
}
//    age: 3
//    age: 20
//    age: 60

for (key, value) in languageCode {
    print("\\(key)의 언어코드는 \\(value)")
}
//    한국의 언어코드는 ko
//    미국의 언어코드는 en
//    일본의 언어코드는 ja
```



일정 횟수를 단순 반복하고 싶은 경우에는 아래와 같이 사용 가능

```swift
print("전방에 다짐 10번 발사~~!")

for _ in 0..<10 {
    print("나는 iOS 개발자다!")
}
```



특정 조건을 이용해서 반복하는 경우에는 `while` 반복문 이용

```swift
var count = 10

print("Ready!")

while count > 0 {
    print("\\(count)...")
    count -= 1
}

print("START!")
```



## 옵셔널

값이 있을수도 있고, 없을수도 있음을 표현

`?` 을 이용해서 표현



```swift
// Dictionary (Key: Value)
let languageCode = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja",
]

let krCode = languageCode["한국"] // "ko"
let jpCode = languageCode["일본"] // "ja"
let deCode = languageCode["독일"] // nil
```

값이 있을수도, 없을수도 있는 경우 → Optional 로 표현



위에 사례에서, `krCode`, `jpCode`, `deCode` 모두 타입을 살펴보면 `타입 + ?` 으로 표현된것을 확인할수 있음

```swift
// 이름이 있을수도 있고 없을수 있는 타입 선언 => String?
var name: String? = nil

name = "Jason"
name = nil
```



## 함수와 클로저

### 함수는 `func` 키워드를 사용해서 선언

`()` 안에 인자를 받을수 있게 만들수도 있고, 

반환되는 값이 있는 경우 `->` 을 이용해서 반환 타입을 선언함

```swift
func printGugu(dan: Int) {
    for i in 1...9 {
        print("\\(dan) * \\(i) = \\(dan * i)")
    }
}

printGugu(dan: 5)

//    5 * 1 = 5
//    5 * 2 = 10
//    5 * 3 = 15
//    5 * 4 = 20
//    5 * 5 = 25
//    5 * 6 = 30
//    5 * 7 = 35
//    5 * 8 = 40
//    5 * 9 = 45

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let random = rollDice()
```



### 클로저는 "이름이 존재하지 않는 함수"라고 생각하면 편하다.

함수와 클로저는 Variable 이나 Constant 에 할당할 수 있다.

```swift
// 함수 
func call(name: String) {
    print("hello, \\(name)")
}

call(name: "Jason")
// hello, Jason

// 상수에 함수 할당하고, 해당 상수를 호출 해보기 
let callName = call
callName("Aha")
// hello, Aha

// 상수에 클로저 할당하고, 해당 상수 호출 해보기 
let helloName = { (name: String) in
    print("hello, \\(name)")
}
helloName("Oho")
// hello, Oho
```

- `in` 을 통해서, 파라미터 및 반환 타입과 실제 클로저 코드를 분리

```swift
// 클로져 형태
{ (name: String) -> Bool in  
   // some code

}
```



클로저는 배열, 딕셔너리 같은 `컬렉션 타입`과 함께, `filter`, `map`, `reduce` 메소드 사용시 자주 활용된다.

```swift
// filter
let members = ["Jason", "Greg", "Tiffany"]
let nameHasT = members.filter { name in
    return name.hasPrefix("T")
}
// ["Tiffany"]


// map
let prices = [1000, 2000, 3000]
let doubledPrices = prices.map { price in
    return price * 2
}
// [2000, 4000, 6000]

// reduce
let revenues = [100, 200, 300]
let totalRevenue = revenues.reduce(0) { partialResult, next in
    return partialResult + next
}
// 600
```



## 구조체와 클래스

### 구조체

구조체는 사용자가 원하는 "데이터타입"을 만들때 사용

`struct` 키워드를 이용해서 선언

```swift
struct Album {
		// 멤버 변수들
		// stored property
    let title: String
    let artist: String
    var isReleased = false
    
    func description() -> String {
        return "\(title) by \(artist)"
    }
    
		// 구조체 내부 멤버 변수의 값을 변경하는 경우, mutating 키워드 이용
    mutating func release() {
        self.isReleased = true
    }
}

var easyOnMe = Album(title: "Easy On Me", artist: "Adele")
print(easyOnMe.description())
// Easy On Me by Adele

print(easyOnMe.isReleased)
easyOnMe.release()
print(easyOnMe.isReleased)
// false
// true
```



### 클래스

클래스도 사용자가 원하는 데이터타입을 만들때 사용하는데, 구조체 몇가지 다른 점이 있다

`class` 를 이용해서 선언

클래스는 상속이 가능함 (구조체는 불가능)

클래스는 참조(reference)하고, 구조체는 복사(copy)한다.

클래스는 멤버와이즈 이니셜라이저(생성자)를 기본으로 안 만들어준다.

- 생성자란, 클래스 또는 구조체를 생성할때 사용하는 특별한 함수 (`init` 키워드로 선언)



```swift
class Employee {
    var name: String
    var hours: Int
    // 생성자를 따로 만들어주어야 한다. (구조체는 자동으로 만들어줌)
    init(name: String, hours: Int) {
        self.name = name
        self.hours = hours
    }
    
    func work() {
        print("I'm working now...")
    }
    
    func summary() {
        print("I work \(self.hours) hours a day. ")
    }
}

// 상속 가능
class iOSDeveloper: Employee {
    
    override func work() {
        print("I'm developing iOS app now.")
    }
    
    override func summary() {
        print("I work \(self.hours/2) hours a day.")
    }
}

let normalWorker = Employee(name: "Kim", hours: 8)
normalWorker.work()
normalWorker.summary()
//    I'm working now...
//    I work 8 hours a day.

let developer = iOSDeveloper(name: "Jason", hours: 8)
developer.work()
developer.summary()
//    I'm developing iOS app now.
//    I work 4 hours a day.


// Reference vs. Copy
// 구조체
struct Phone {
    var modelName: String
    var manufacturer: String
    var version: Double = 1.0
}
// 구조체 - 복사
var iPhone1 = Phone(modelName: "iPhone 13", manufacturer: "Apple")
var iPhone2 = iPhone1
iPhone2.modelName = "iPhone 14"
print(iPhone2.modelName)
print(iPhone1.modelName)
//    iPhone 14
//    iPhone 13

// 클래스 - 참조
var jrDeveloper1 = iOSDeveloper(name: "John", hours: 8)
var jrDeveloper2 = jrDeveloper1
jrDeveloper1.name = "Billy"
print(jrDeveloper1.name)
print(jrDeveloper2.name)
//    Billy
//    Billy
```



#### stored property vs. computed property

`stored property`: 앞에서 본것처럼 클래스, 구조체가 값을 저장하고 있는 프로퍼티이다.

`computed property`: 따로 값을 저장하지는 않고, 기존의 `stored property` 를 활용하거나 특정값을 전달할때 사용하는 프로퍼티이다.

```swift
struct Watch {
    // stored property
    let model: String
    let manufacturer: String
  
    // computed property
    var description: String {
        return "\(model) by \(manufacturer)"
    }
}

struct Person {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

let appleWatch = Watch(model: "Watch 7", manufacturer:  "Apple")
print(appleWatch.description)
// Watch 7 by Apple

let jason = Person(firstName: "Jason", lastName: "Lee")
print(jason.fullName)
// Jason Lee
```



## 프로토콜

: 제공하고 싶은 역할(기능, 속성)을 미리 정의해 놓은 것 

이후에 다른 타입이 해당 프로토콜의 역할을 제공하고 싶으면, conform 해서 제공한다.

```swift
protocol Coach {
    var name: String { get set }
    var currentTeam: String { get }
    func training()
    func direct()
}

struct Mourinho: Coach {
    var name: String = "Jose Mourinho"
    var currentTeam: String = "AS Roma"
    
    func training() {
        print("Traing Player")
    }
    
    func direct() {
        print("Direct Game")
    }
}

let mourinho = Mourinho()
print("\(mourinho.name), \( mourinho.currentTeam)")
mourinho.training()
mourinho.direct()

//    Jose Mourinho, AS Roma
//    Traing Player
//    Direct Game
```



## 익스텐션

기존 타입에 새로운 역할(기능 및 속성)을 추가하고 싶을때 사용

- 원하는 내장함수를 사용자가 만들어 사용할 수 있다.

```swift
extension String {
    func contains(s: String) -> Bool {
        return self.range(of: s) != nil
    }
    
    func replace(target: String, with: String) -> String {
        return self.replacingOccurrences(of: target, with: with)
    }
}


let testString = "Hello iOS Developer!!"
let replaced = testString.replace(target: "Hello", with: "안녕하세요")

print(replaced)
//	안녕하세요 iOS Developer!!
print(testString.contains(s: "iOS"))
// true
```

