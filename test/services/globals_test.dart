import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/globals.dart';

void main() {
  group('Test Global mixin', () {
    test('Should return valid Model', () {
      const String id = 'id';
      final Map data = {};

      expect(Global.models[Dish](id, data), isInstanceOf<Dish>());
      expect(Global.models[Event](id, data), isInstanceOf<Event>());
      expect(Global.models[Article](id, data), isInstanceOf<Article>());
      expect(Global.models[Subject](id, data), isInstanceOf<Subject>());
      expect(Global.models[University](id, data), isInstanceOf<University>());
      expect(Global.models[UserModel](id, data), isInstanceOf<UserModel>());
      expect(Global.models[Grade](id, data), isInstanceOf<Grade>());
    });
  });
}
