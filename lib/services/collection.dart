import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'services.dart';

class Collection<T> {
  final FirebaseFirestore _firestore;
  final String path;
  final int limit;
  final List<String> order;
  final List<CustomQuery> queries;
  Query ref;

  Collection(
      {@required this.path,
      this.queries,
      this.limit,
      this.order,
      FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance {
    ref = _firestore.collection(path);
    _addFilter(queries ?? []);
    _addLimit(limit ?? 0);
    _addOrder(order ?? []);
  }

  void _addOrder(List<String> order) {
    ref = order.isEmpty
        ? ref
        : ref.orderBy(order[0], descending: !(order[1] == 'ASC') ?? false);
  }

  void _addLimit(int limit) {
    ref = limit > 0 ? ref.limit(limit) : ref;
  }

  void _addFilter(List<CustomQuery> queries) {
    if (queries.isEmpty) {
      return;
    }

    final int i = queries.length - 1;

    final String field = queries[i].field;
    final String operation = queries[i].operation;
    final dynamic value = queries[i].value;

    final Map<String, Query> operations = {
      '==': ref.where(field, isEqualTo: value),
      '<': ref.where(field, isLessThan: value),
      '>': ref.where(field, isGreaterThan: value),
      '<=': ref.where(field, isLessThanOrEqualTo: value),
      '>=': ref.where(field, isGreaterThanOrEqualTo: value),
      'arrayContains': ref.where(field, arrayContains: value),
      'arrayContainsAny':
          ref.where(field, arrayContainsAny: value is List ? value : [value]),
      'isNull': ref.where(field, isNull: true),
      'whereIn': ref.where(field, whereIn: value is List ? value : [value]),
    };

    ref = operations[operation] ?? ref;
    queries.removeAt(i);
    _addFilter(queries);
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
