// class Meal {
//   late String _description;
//
//   set description(String desc) {
//     _description = 'meal description: $desc';
//   }
//
//   String get description => _description;
// }
//
// void main() {
//   final myMeal = Meal();
//   myMeal.description = 'konichiwa';//   print(myMeal.description);
// }

// Late với class
class Person {
  late String fullName =
      _getFullName(); //Khi nào cần fullName lần đầu → chạy _getFullName() để lấy giá trị”
  late String firstName = fullName.split(" ").first;
  late String lastName = fullName.split(" ").last;

  String _getFullName() {
    print("_getFullName is called");
    return "John Doe"; // --> cái này là fullName
  }
}

void main() {
  print("Start");
  Person person = Person();
  print("First Name: ${person.firstName}"); //firstName cần fullName
  // → fullName chưa có → gọi _getFullName() --> lấy được 'John Doe' (chính là fullName)

  print("Last Name: ${person.lastName}");
  //vì fullname đã được lấy nên _getFullName không được gọi nữa
  print("Full Name: ${person.fullName}");
  print("End");
}

