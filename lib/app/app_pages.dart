import 'package:fitness_app/app/bindings.dart';
import 'package:fitness_app/app/routes.dart';
import 'package:fitness_app/screens/history/history_view.dart';
import 'package:fitness_app/screens/login/login_screen.dart';
import 'package:fitness_app/screens/bottom_navigation/navigation_view.dart';
import 'package:fitness_app/screens/register/register_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
    ),

    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
    ),
    GetPage(
      name: Routes.history,
      page: () => HistoryView(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => NavigationView(),
      binding: AppBinding(),
    ),
  ];
}