import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'services.dart';

class Document<T> {
  FirebaseFirestore firestore;
  final String path;
  DocumentReference ref;

  Document({@required this.path, FirebaseFirestore firestore})
      : firestore = firestore ?? FirebaseFirestore.instance {
    ref = firestore.doc(path);
  }

  Future<T> getData() {
    return ref.get().then((doc) {
      try {
        return Global.models[T](doc.id, doc.data()) as T;
      } catch (e) {
        return Samples.models[T]() as T;
      }
    });
  }

  Stream<T> streamData() {
    return ref.snapshots().map((doc) {
      try {
        return Global.models[T](doc.id, doc.data()) as T;
      } catch (e) {
        return Samples.models[T]() as T;
      }
    });
  }

  Future<void> upsert(Map data) {
    return ref.update(Map<String, dynamic>.from(data)).catchError((err) {
      return;
    });
  }

  Future<void> createAndMerge(Map data) {
    return ref
        .set(Map<String, dynamic>.from(data), SetOptions(merge: true))
        .catchError((err) {
      return;
    });
  }
}
