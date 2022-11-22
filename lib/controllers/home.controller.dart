import 'package:get/get.dart';

enum AppBarState { dashboard, menu, transaction, settings }

enum CartModeState { on, off }

class HomeController extends GetxController {
  final Rx<AppBarState> _appbarState = AppBarState.menu.obs;
  AppBarState get appbarState => _appbarState.value;

  final Rx<CartModeState> _cartModeState = CartModeState.on.obs;
  CartModeState get cartModeState => _cartModeState.value;
  bool get isCartMode => _cartModeState.value == CartModeState.on;

  // ? ----------------------------------appbarStates

  goDashboard() {
    _appbarState.value = AppBarState.dashboard;
  }

  goMenu() {
    _appbarState.value = AppBarState.menu;
  }

  goTransaction() {
    _appbarState.value = AppBarState.transaction;
  }

  goToSettings() {
    _appbarState.value = AppBarState.settings;
  }

  startShopping() {
    _cartModeState.value = CartModeState.on;
  }

  cancelShopping() {
    _cartModeState.value = CartModeState.off;
  }

  // ? ---------------------------end of appbarStates
}
