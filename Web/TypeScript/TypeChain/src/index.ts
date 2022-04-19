// interface Human {
//   name: string;
//   age: number;
//   gender: string;
// }
// const person = {
//   name: "bob",
//   age: 24,
//   gender: "male",
// };

class Human {
  public name: string;
  public age: number;
  public gender: string;

  constructor(name: string, age: number, gender: string) {
    this.name = name;
    this.age = age;
    this.gender = gender;
  }
}

const bob = new Human("bob", 24, "male");

const sayHi = (person: Human): string => {
  return `Hello ${person.name}, aged ${person.age}! You are a ${person.gender}.`;
};

console.log(sayHi(bob));

export {};
