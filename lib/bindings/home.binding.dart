import 'package:get/get.dart';
import 'package:pp_cashier/controllers/home.controller.dart';
import 'package:pp_cashier/controllers/cart.controller.dart';
import 'package:pp_cashier/controllers/member.controller.dart';
import 'package:pp_cashier/controllers/transaction.controller.dart';

/// Binding for home screen
/// Put HomeController
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => TransactionController());
    Get.lazyPut(() => MemberController());
  }
}
