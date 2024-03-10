import 'package:start_up_workspace/models/user_model.dart';

class Globals {
  Globals._();

  static final Globals _instance = Globals._();

  factory Globals() => _instance;

  UserModel? userModel;
  void changeUserModel(UserModel? value) {
    userModel = value;
  }
}
