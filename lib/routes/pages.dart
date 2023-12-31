import 'package:get/get.dart';
import 'package:mundumwallet/modules/home/home_screen.dart';
import 'package:mundumwallet/modules/create_wallet/create_pass_screen.dart';
import 'package:mundumwallet/modules/on_board/on_board_screen.dart';
import 'package:mundumwallet/modules/splash/splash_screen.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.onBoardScreen,
      page: () => const OnBoardScreen(),
    ),
    GetPage(
      name: Routes.homescreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.createPassScreen,
      page: () => const CreatePassScreen(),
    ),
  ];
}
