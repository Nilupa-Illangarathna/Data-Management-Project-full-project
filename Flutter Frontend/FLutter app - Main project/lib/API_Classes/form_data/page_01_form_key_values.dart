enum InputType {
  text,
  numbers,
  textNoNumbers,
}

class UserInputKeyValues {
  static Map<String, InputType> inputTypes = {
    'Name': InputType.text,
    'Age': InputType.numbers,
    'Country': InputType.textNoNumbers,
    'Preferences': InputType.text,
    'Description': InputType.text,
  };

  static Map<String, int> maxFieldLengths = {
    'Name': 50,
    'Age': 3,
    'Country': 50,
    'Preferences': 100,
    'Description': 500,
  };
}
