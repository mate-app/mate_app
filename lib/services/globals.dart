import 'package:mateapp/models/models.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mateapp/services/services.dart';

mixin Global {
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  static final Map models = {
    Dish: (data) => Dish.fromMap(data),
    Event: (data) => Event.fromMap(data),
    Article: (data) => Article.fromMap(data),
    Subject: (data) => Subject.fromMap(data),
    University: (data) => University.fromMap(data),
    UserModel: (data) => UserModel.fromMap(data),
    Grade: (data) => Grade.fromMap(data),
  };

  static final UserData<UserModel> userModelRef =
      UserData<UserModel>(collection: 'users');

  static final Collection<University> universityRef =
      Collection<University>(path: 'hochschulen');
}
