import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';
import 'services.dart';

class UserData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;
  User user;

  UserData({this.collection, this.user});

  Stream<UserModel> get documentStream {
    user = _auth.currentUser;
    if (_auth.currentUser != null) {
      final Document<UserModel> doc =
          Document<UserModel>(path: '$collection/${user.uid}');
      return doc.streamData();
    } else {
      return Stream<UserModel>.value(null);
    }
  }

  Future<void> upsert(Map data) async {
    final User user = _auth.currentUser;
    final Document<UserModel> ref = Document(path: '$collection/${user.uid}');
    return ref.createAndMerge(data);
  }
}
