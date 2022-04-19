const sayHi = (name: string, age: number, gender: string): string => {
  return `Hello ${name}, aged ${age}! You are a ${gender}.`;
};

console.log(sayHi("Taylor", 24, "male"));

export {};
