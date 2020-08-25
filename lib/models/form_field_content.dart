class FormFieldContent {
  String fieldContent;

  // Constructer
  FormFieldContent(this.fieldContent);

  bool checkIfFieldsAreEmpty() {
    return fieldContent.isEmpty ? true : false;
  }
}

class MailFieldContent extends FormFieldContent {
  // Constructor
  MailFieldContent(String fieldContent) : super(fieldContent);

  bool checkIfDomainMatches(String domain) {
    return fieldContent.endsWith(domain) ? true : false;
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
