import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pp_cashier/routes/app_pages.dart';
import 'package:pp_cashier/services/http.service.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  /// initialize hive box service

  Get.put(HTTPService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cashier',
      debugShowCheckedModeBanner: kDebugMode,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      unknownRoute: AppPages.notFoundRoute,
    );
  }
}
