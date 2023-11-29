class UserInput {
  String name = '';
  String age = '';
  String country = '';
  String preferences = '';
  String description = '';
}

class UserFormInputObject {
  static UserInput userInput = UserInput();

  static void printCurrentValues() {
    print('Name: ${userInput.name}');
    print('Age: ${userInput.age}');
    print('Country: ${userInput.country}');
    print('Preferences: ${userInput.preferences}');
    print('Description: ${userInput.description}');
  }
}

