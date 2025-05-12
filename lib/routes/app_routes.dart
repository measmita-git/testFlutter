import 'package:get/get_navigation/src/routes/get_route.dart';

import '../controller/counter_binding.dart';
import '../view/counter_screen.dart';
import '../view/name_entry_view.dart';

abstract class AppRoutes {
  static const counter = '/counter';
  static const nameEntry = '/name-entry';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.counter,
      page: () => const CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: AppRoutes.nameEntry,
      page: () => const NameEntryView(),
      binding: CounterBinding(),
    ),
  ];
}