import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Document<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  DocumentReference ref;

  Document({this.path}) {
    ref = _db.doc(path);
    // implement optional filter
  }

  Future<T> getData() {
    return ref.get().then((doc) => Global.models[T](doc) as T);
  }

  Stream<T> streamData() {
    return ref.snapshots().map((v) => Global.models[T](v) as T);
  }

  Future<void> upsert(Map data) {
    return ref
        .update(Map<String, dynamic>.from(data))
        .catchError((err) => print('error: $err'));
  }

  Future<void> createAndMerge(Map data) {
    return ref
        .set(Map<String, dynamic>.from(data), SetOptions(merge: true))
        .catchError((err) => print('error: $err'));
  }
}

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
        : ref.orderBy(order[0], descending: order[1] == 'asc' ? false : true);
  }

  void _addLimit(int limit) {
    ref = limit > 0 ? ref.limit(limit) : ref;
  }

  void _addFilter(List<CustomQuery> queries, int loops) {
    if (loops > 0) {
      loops--;
      String field = queries[loops].field;
      String operation = queries[loops].operation;
      dynamic value = queries[loops].value;

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
          ref = ref.where(field, arrayContainsAny: value);
          break;
        case 'isNull':
          ref = ref.where(field, isNull: value);
          break;
        default:
          ref = ref;
      }
      _addFilter(queries, loops);
    }
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.get();
    return snapshots.docs.map((doc) => Global.models[T](doc) as T).toList();
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Global.models[T](doc) as T).toList());
  }
}

class UserData<T> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;

  UserData({this.collection});

  Stream<T> get documentStream {
    if (_auth.currentUser != null) {
      Document<T> doc =
          Document<T>(path: '$collection/${_auth.currentUser.uid}');
      return doc.streamData();
    } else {
      return Stream<T>.value(null);
    }
  }

  Future<void> upsert(Map data) async {
    User user = _auth.currentUser;
    Document<T> ref = Document(path: '$collection/${user.uid}');
    return ref.createAndMerge(data);
  }
}
// String _convertDateToString(Timestamp timestamp) {
//     initializeDateFormatting('de_DE', null);
//     return DateFormat('dd. MMM y', 'de_DE')
//         .format(DateTime.parse(timestamp.toDate().toString()));
//   }
