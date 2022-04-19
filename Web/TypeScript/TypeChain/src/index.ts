interface Human {
  name: string;
  age: number;
  gender: string;
}

const person = {
  name: "bob",
  age: 24,
  gender: "male",
};

const sayHi = (person: Human): string => {
  return `Hello ${person.name}, aged ${person.age}! You are a ${person.gender}.`;
};

console.log(sayHi(person));

export {};
