import 'package:mateapp/models/models.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mateapp/services/services.dart';

mixin Global {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  static final Map models = {
    Dish: (id, data) => Dish.fromMap(id, data),
    Event: (id, data) => Event.fromMap(id, data),
    Article: (id, data) => Article.fromMap(id, data),
    Subject: (id, data) => Subject.fromMap(id, data),
    University: (id, data) => University.fromMap(id, data),
    UserModel: (id, data) => UserModel.fromMap(id, data),
    Grade: (id, data) => Grade.fromMap(id, data),
  };

  static final UserData userModelRef = UserData(collection: 'users');

  static final Collection<University> universityRef =
      Collection<University>(path: 'hochschulen');
}
