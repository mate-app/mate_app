import 'package:mateapp/models/models.dart';

mixin Samples {
  static final Map models = {
    Dish: () => Dish(),
    Event: () => Event(),
    Article: () => Article(),
    Subject: () => Subject(),
    University: () => University(),
    UserModel: () => UserModel(),
    Grade: () => Grade(),
  };
}
