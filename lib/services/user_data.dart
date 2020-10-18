import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';
import 'services.dart';

class UserDataService {
  FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final String collection;
  User user;

  UserDataService(
      {this.collection,
      this.user,
      FirebaseAuth auth,
      FirebaseFirestore firestore})
      : auth = auth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance {
    user = auth.currentUser;
  }

  Stream<UserModel> get documentStream {
    if (auth.currentUser != null) {
      final Document<UserModel> doc = Document<UserModel>(
          firestore: firestore, path: '$collection/${user.uid}');
      return doc.streamData();
    } else {
      return Stream<UserModel>.value(null);
    }
  }

  Future<void> upsert({Map data}) async {
    final Document<UserModel> ref =
        Document(firestore: firestore, path: '$collection/${user.uid}');
    data['user_id'] = user.uid;
    return ref.createAndMerge(data);
  }
}
