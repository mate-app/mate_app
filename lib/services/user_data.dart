import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';
import 'services.dart';

class UserDataService {
  final FirebaseAuth auth;
  final String collection;
  User user;

  UserDataService({this.collection, this.user, FirebaseAuth auth})
      : auth = auth ?? FirebaseAuth.instance;

  Stream<UserModel> get documentStream {
    user = auth.currentUser;
    if (auth.currentUser != null) {
      final Document<UserModel> doc =
          Document<UserModel>(path: '$collection/${user.uid}');
      return doc.streamData();
    } else {
      return Stream<UserModel>.value(null);
    }
  }

  Future<void> upsert({Map data}) async {
    user = auth.currentUser;
    final Document<UserModel> ref = Document(path: '$collection/${user.uid}');
    data['user_id'] = user.uid;
    return ref.createAndMerge(data);
  }
}
