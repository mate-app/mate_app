import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() {
  final MockFirestoreInstance _firestore = MockFirestoreInstance();

  final Document<Dish> _doc = Document(
      firestore: _firestore, path: 'hochschulen/fhkiel/dish/reference');

  group('Test Firestore Document class', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    test('Should Return valid Model', () async {
      await _firestore.collection('hochschulen/fhkiel/dish').doc('id').set({
        'name': 'dish1',
      });
      final dish = await Document<Dish>(
              firestore: _firestore, path: 'hochschulen/fhkiel/dish/id')
          .getData();
      expect(dish, isInstanceOf<Dish>());
      expect(dish.name, 'dish1');
    });

    test('Should Return Sample-Model', () async {
      final dish = await _doc.getData();
      expect(dish, isInstanceOf<Dish>());
      expect(dish.name, '');
    });

    test('Should return Stream<Model>', () async {
      final dish = _doc.streamData();

      expect(dish, isInstanceOf<Stream<Dish>>());
      expect(await dish.last, isInstanceOf<Dish>());
    });

    test('Should return void and update data in firestore', () async {
      await _firestore.collection('hochschulen/fhkiel/dish').doc('id').set({
        'name': 'dish1',
      });
      final _doc = Document<Dish>(
          firestore: _firestore, path: 'hochschulen/fhkiel/dish/id');
      await _doc.upsert({
        'name': 'dish2',
      });
      final dish = await _doc.getData();
      expect(dish.name, 'dish2');
    });

    test('Should return void and create doc', () async {
      await _doc.createAndMerge({
        'name': 'dish1',
      });
      final dish = await _doc.getData();
      expect(dish.name, 'dish1');
    });

    test('Should return void and merge doc', () async {
      await _doc.createAndMerge({
        'name': 'dish1',
      });
      await _doc.createAndMerge({
        'rating': 8,
      });
      final dish = await _doc.getData();
      expect(dish.name, 'dish1');
      expect(dish.rating, 8);
    });
  });
}
