import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/samples.dart';

void main() {
  group('Test Samples mixin', () {
    test('Should return valid Sample Model', () {
      expect(Samples.models[Dish](), isInstanceOf<Dish>());
      expect(Samples.models[Event](), isInstanceOf<Event>());
      expect(Samples.models[Article](), isInstanceOf<Article>());
      expect(Samples.models[Subject](), isInstanceOf<Subject>());
      expect(Samples.models[University](), isInstanceOf<University>());
      expect(Samples.models[UserModel](), isInstanceOf<UserModel>());
      expect(Samples.models[Grade](), isInstanceOf<Grade>());
    });
  });
}
