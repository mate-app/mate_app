import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'services.dart';

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
    return ref.snapshots().map((doc) => Global.models[T](doc) as T);
  }

  Future<void> upsert(Map data) {
    return ref.update(Map<String, dynamic>.from(data)).catchError((err) =>
        Crashlytics.instance.recordError('error: $err', StackTrace.current));
  }

  Future<void> createAndMerge(Map data) {
    return ref
        .set(Map<String, dynamic>.from(data), SetOptions(merge: true))
        .catchError((err) => Crashlytics.instance
            .recordError('error: $err', StackTrace.current));
  }
}
