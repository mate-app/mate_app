import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() {
  final MockFirestoreInstance _firestore = MockFirestoreInstance();

  setUpAll(() async {
    await _firestore.collection('hochschulen/fhkiel/dish').doc('0').set({
      'name': 'dish1',
    });
    await _firestore.collection('hochschulen/fhkiel/dish').doc('1').set({
      'name': 'dish2',
    });
    await _firestore.collection('hochschulen/fhkiel/dish').doc('2').set({
      'name': 'dish2',
    });
    await _firestore.collection('hochschulen/fhkiel/dish').doc('err').set({
      'name': 78,
    });
  });

  group('Test Firestore Collection Class', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    final Collection<Dish> _col =
        Collection(firestore: _firestore, path: 'hochschulen/fhkiel/dish');

    test('Should return valid List of Model', () async {
      final dishes = await _col.getData();
      expect(dishes, isInstanceOf<List<Dish>>());
      expect(dishes.length, 4);
    });

    test('Should return a valid ordered, filtered and limited list', () async {
      final Collection<Dish> _col = Collection(
          firestore: _firestore,
          path: 'hochschulen/fhkiel/dish',
          queries: [
            CustomQuery(field: 'name', operation: '==', value: 'dish2')
          ],
          order: ['name', 'DESC'],
          limit: 1);
      final dishes = await _col.getData();
      expect(dishes, isInstanceOf<List<Dish>>());
      expect(dishes.length, 1);
    });

    test('Should return sample model', () async {
      final Collection<Dish> _col =
          Collection(firestore: _firestore, path: 'hochschulen/fhkiel/dish');
      final dishes = await _col.getData();
      expect(dishes, isInstanceOf<List<Dish>>());
      expect(dishes[3].name, '');
    });

    test('Should return Stream<List<Model>>', () async {
      final dishes = _col.streamData();
      dishes.listen(expectAsync1((event) {
        expect(event[0], isInstanceOf<Dish>());
      }));
    });
  });
}
