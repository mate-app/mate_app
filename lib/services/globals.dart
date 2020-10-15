import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/models.dart';
import 'services.dart';

mixin Global {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  static final Map models = {
    Dish: (String id, data) => Dish.fromMap(id, data),
    Event: (String id, data) => Event.fromMap(id, data),
    Article: (String id, data) => Article.fromMap(id, data),
    Subject: (String id, data) => Subject.fromMap(id, data),
    University: (String id, data) => University.fromMap(id, data),
    UserModel: (String id, data) => UserModel.fromMap(id, data),
    Grade: (String id, data) => Grade.fromMap(id, data),
  };

  static final UserDataService userModelRef =
      UserDataService(collection: 'users');

  static final Collection<University> universityRef =
      Collection<University>(path: 'hochschulen');
}
