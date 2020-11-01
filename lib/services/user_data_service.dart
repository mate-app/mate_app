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
        firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel> get document {
    user = auth.currentUser;
    final Document<UserModel> doc = Document<UserModel>(
        firestore: firestore, path: '$collection/${user.uid}');
    return doc.getData();
  }

  Stream<UserModel> get documentStream {
    user = auth.currentUser;
    if (auth.currentUser != null) {
      final Document<UserModel> doc = Document<UserModel>(
          firestore: firestore, path: '$collection/${user.uid}');
      try {
        return doc.streamData();
      } catch (e) {
        return Stream<UserModel>.value(null);
      }
    } else {
      return Stream<UserModel>.value(null);
    }
  }

  Future<void> upsert({Map data}) async {
    user = auth.currentUser;
    final Document<UserModel> ref =
        Document(firestore: firestore, path: '$collection/${user.uid}');
    data['user_id'] = user.uid;
    return ref.createAndMerge(data);
  }
}
