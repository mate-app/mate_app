import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import 'services.dart';

class Collection<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  final int limit;
  final List<String> order;
  final List<CustomQuery> queries;
  Query ref;

  Collection(
      {this.path,
      this.queries = const [],
      this.limit = 0,
      this.order = const []}) {
    ref = _db.collection(path);
    _addFilter(queries, queries.length);
    _addLimit(limit);
    _addOrder(order);
  }

  void _addOrder(List<String> order) {
    ref = order.isEmpty
        ? ref
        : ref.orderBy(order[0], descending: !(order[1] == 'ASC') ?? false);
  }

  void _addLimit(int limit) {
    ref = limit > 0 ? ref.limit(limit) : ref;
  }

  void _addFilter(List<CustomQuery> queries, int loops) {
    int i = loops;
    if (loops > 0) {
      i--;
      final String field = queries[i].field;
      final String operation = queries[i].operation;
      final dynamic value = queries[i].value;

      switch (operation) {
        case '==':
          ref = ref.where(field, isEqualTo: value);
          break;
        case '<':
          ref = ref.where(field, isLessThan: value);
          break;
        case '>':
          ref = ref.where(field, isGreaterThan: value);
          break;
        case '<=':
          ref = ref.where(field, isLessThanOrEqualTo: value);
          break;
        case '>=':
          ref = ref.where(field, isGreaterThanOrEqualTo: value);
          break;
        case 'arrayContains':
          ref = ref.where(field, arrayContains: value);
          break;
        case 'arrayContainsAny':
          ref = ref.where(field, arrayContainsAny: value as List<dynamic>);
          break;
        case 'isNull':
          ref = ref.where(field, isNull: value as bool);
          break;
        case 'whereIn':
          ref = ref.where(field, whereIn: value as List<dynamic>);
          break;
        default:
          ref = ref;
      }
      _addFilter(queries, i);
    }
  }

  Future<List<T>> getData() async {
    final QuerySnapshot snapshots = await ref.get();
    return snapshots.docs.map((doc) {
      try {
        return Global.models[T](doc.id, doc.data()) as T;
      } catch (e) {
        return Samples.models[T] as T;
      }
    }).toList();
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((snapshot) => snapshot.docs.map((doc) {
          try {
            return Global.models[T](doc.id, doc.data()) as T;
          } catch (e) {
            return Samples.models[T] as T;
          }
        }).toList());
  }
}
