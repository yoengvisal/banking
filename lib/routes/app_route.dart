import 'package:banking/views/auth/screen/sign_in_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteName {
  static const String login = '/login';
}

class AppRoute {
  static final routes = [
    GetPage(name: RouteName.login, page: () => SignInScreen()),
  ];
}
