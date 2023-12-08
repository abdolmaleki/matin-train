import 'package:hoivalani/core/utils/architecture/data/common_models/user.dart';

class AppValidator {
  static bool isUserDispatcher(UserModel user) {
    return user.roleIds!.any((element) => element.id == 5);
  }
}
