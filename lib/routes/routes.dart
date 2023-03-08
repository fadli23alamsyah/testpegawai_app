import 'package:get/get.dart';
import 'package:pegawaiediites_app/routes/route_name.dart';
import 'package:pegawaiediites_app/screens/form_employee_screen.dart';
import 'package:pegawaiediites_app/screens/employee_screen.dart';
import 'package:pegawaiediites_app/screens/home_screen.dart';
import 'package:pegawaiediites_app/screens/login_screen.dart';
import 'package:pegawaiediites_app/screens/register_screen.dart';
import 'package:pegawaiediites_app/screens/splash_screen.dart';
import 'package:pegawaiediites_app/screens/update_profile_screen.dart';

class Routes {
  static const initialRoute = RouteName.splashScreen;

  static final getRoutes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteName.registerScreen,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteName.listEmployeeScreen,
      page: () => const EmployeeScreen(),
    ),
    GetPage(
      name: RouteName.formEmployeeScreen,
      page: () => const FormEmployeeScreen(),
    ),
    GetPage(
      name: RouteName.updateProfileScreen,
      page: () => const UpdateProfileScreen(),
    ),
  ];
}
