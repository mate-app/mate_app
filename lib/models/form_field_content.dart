class FormFieldContent {
  String fieldContent;

  FormFieldContent(this.fieldContent);

  bool isEmpty() {
    if (fieldContent != null) {
      return fieldContent.isEmpty;
    } else {
      return true;
    }
  }
}

class MailFieldContent extends FormFieldContent {
  MailFieldContent(String fieldContent) : super(fieldContent);

  bool isDomainMatching(String domain) {
    if (fieldContent != null) {
      return fieldContent.endsWith(domain);
    } else {
      return false;
    }
  }
}

class PasswordFieldContent extends FormFieldContent {
  int maxLength;
  int minLength;

  PasswordFieldContent(
    String fieldContent, {
    this.maxLength = 20,
    this.minLength = 6,
  }) : super(fieldContent);

  bool isPasswordSecure() {
    if (fieldContent != null) {
      if (fieldContent.length < minLength || fieldContent.length > maxLength) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
}
