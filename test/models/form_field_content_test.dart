import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/form_field_content.dart';

void main() {
  group('Test FormFieldContent Model', () {
    const string = 'string';

    test('Should return Instance of FormFieldContent', () {
      expect(FormFieldContent(string), isInstanceOf<FormFieldContent>());
    });
    test('Should return instance of FormFieldContent when null given', () {
      expect(FormFieldContent(null), isInstanceOf<FormFieldContent>());
    });

    test('Should return bool whether fieldcontent is empty', () {
      expect(FormFieldContent('').isEmpty(), true);
      expect(FormFieldContent(null).isEmpty(), true);
      expect(FormFieldContent(string).isEmpty(), false);
    });
  });

  group('Test MailFieldcontent Model', () {
    const string = 'string';

    test('Should return instance of MailFieldContent', () {
      expect(MailFieldContent(string), isInstanceOf<MailFieldContent>());
    });

    test('Should return instance of MailFieldContent when null given', () {
      expect(MailFieldContent(null), isInstanceOf<MailFieldContent>());
    });

    test('Should return bool whether domain is matching', () {
      expect(MailFieldContent('').isDomainMatching(string), false);
      expect(MailFieldContent(null).isDomainMatching(string), false);
      expect(MailFieldContent(string).isDomainMatching(string), true);
    });
  });

  group('Test PasswordFieldcontent Model', () {
    const string = 'string';

    test('Should return instance of PasswordFieldContent', () {
      expect(
          PasswordFieldContent(string), isInstanceOf<PasswordFieldContent>());
    });

    test('Should return instance of PasswordFieldContent when null given', () {
      expect(PasswordFieldContent(null), isInstanceOf<PasswordFieldContent>());
    });

    test('Should return bool whether domain is matching', () {
      expect(PasswordFieldContent('').isPasswordSecure(), false);
      expect(PasswordFieldContent(null).isPasswordSecure(), false);
      expect(PasswordFieldContent(string).isPasswordSecure(), true);
    });
  });
}
