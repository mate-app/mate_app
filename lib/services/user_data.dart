import 'package:firebase_auth/firebase_auth.dart';

import 'services.dart';

class UserData<T> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;
  User user;

  UserData({this.collection, this.user});

  Stream<T> get documentStream {
    user = _auth.currentUser;
    if (_auth.currentUser != null) {
      final Document<T> doc = Document<T>(path: '$collection/${user.uid}');
      return doc.streamData();
    } else {
      return Stream<T>.value(null);
    }
  }

  Future<void> upsert(Map data) async {
    final User user = _auth.currentUser;
    final Document<T> ref = Document(path: '$collection/${user.uid}');
    return ref.createAndMerge(data);
  }
}
