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

### 변수 (Variables)

: 생성 후 데이터 값을 변경할 수 있다.

- `var` 로 선언한다.

```swift
var [변수명]: [데이터 타입] = [값]  // Type Annotation
```



### 상수 (Constants)

: 생성 후 데이터 값을 변경할 수 없다.

- `let` 으로 선언한다.

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
enum School {
	case primary = "유치원"
	case elementary = "초등학교"
	case middle = "중학교"
	case high = "고등학교"
	case college = "대학"
	case university = "대학교"
}

let highestEducationLevel: School = .university
print("저의 최종 학력은 \(highestEducationLevel.rawValue) 졸업입니다.")  // 저의 최종 학력은 대학교 졸업입니다.
```

