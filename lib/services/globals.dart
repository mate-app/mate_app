import '../models/models.dart';

mixin Global {
  static final Map models = {
    Dish: (String id, data) => Dish.fromMap(id, data),
    Event: (String id, data) => Event.fromMap(id, data),
    Article: (String id, data) => Article.fromMap(id, data),
    Subject: (String id, data) => Subject.fromMap(id, data),
    University: (String id, data) => University.fromMap(id, data),
    UserModel: (String id, data) => UserModel.fromMap(id, data),
    Grade: (String id, data) => Grade.fromMap(id, data),
  };
}
