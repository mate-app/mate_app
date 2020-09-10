class FormFieldContent {
  String fieldContent;

  // Constructer
  FormFieldContent(this.fieldContent);

  bool checkIfFieldsAreEmpty() {
    if (fieldContent.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

class MailFieldContent extends FormFieldContent {
  // Constructor
  MailFieldContent(String fieldContent) : super(fieldContent);

  bool checkIfDomainMatches(String domain) {
    if (fieldContent.endsWith(domain)) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordFieldContent extends FormFieldContent {
  // Constructor
  PasswordFieldContent(String fieldContent) : super(fieldContent);

  bool validatePasswordContent(int maxlength, int minlength) {
    // do something
    if (fieldContent.length < minlength) return false;
    if (fieldContent.length > maxlength) return true;
    return true;
  }
}
