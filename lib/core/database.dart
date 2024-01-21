//
// void main() {
//   // Create a new Flutter project.
//   // Add the Hive package to your project's pubspec.yaml file.
//   // Create a new Hive database file.
//   var box = Hive.openBox('my_box');
//
//   // Open the Hive database file.
//   box.open();
//
//   // Create a new Hive object.
//   var person = Person('John', 30);
//
//   // Save the Hive object to the database.
//   box.put('person', person);
//
//   // Read the Hive object from the database.
//   var person = box.get('person');
//
//   // Delete the Hive object from the database.
//   box.delete('person');
// }
//
// class Person {
//   String name;
//   int age;
//
//   Person(this.name, this.age);
// }
