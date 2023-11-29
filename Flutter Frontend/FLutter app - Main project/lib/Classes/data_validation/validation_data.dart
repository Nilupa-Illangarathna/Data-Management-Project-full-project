// validation_data.dart

final Map<String, String> validationRegex = {
  'email_phone':
      r'^(?:\d{10}|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})$',
  'email': r'[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}',
  'phone':
      r'\d{10}', // Adjust this regex pattern as needed for phone validation // Adjust this regex pattern as needed for phone validation 1->10
  'password':
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!#$%&()*+,-./:;<=>?@[\]^_{|}~])[A-Za-z\d!#$%&()*+,-./:;<=>?@[\]^_{|}~]{8,16}$', //he regular expression will only match passwords that are between 8 and 16 characters in length and meet the other criteria
  // Add more validation keys and regex patterns as needed
  'name': r"^[A-Za-zÀ-ÖØ-öø-ÿ-' ]+$",
  'address': r"^[A-Za-z0-9\s\.,#-]+$"
};

class ValidationData {
  //check user input is a phone or email
  static bool isPhoneNumber(String input) {
    final phoneNumberPattern = validationRegex['phone'];

    if (RegExp(phoneNumberPattern ?? "").hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  //validate user entered email address before sending otp
  static bool isValidEmail(String input) {
    final emailPattern = validationRegex['email'];

    if (RegExp(emailPattern ?? "").hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  //validate user entered phone no before sending otp
  static bool isPhoneValidate(String input) {
    final phonePattern = validationRegex['phone'];

    if (RegExp(phonePattern ?? "").hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }
}
