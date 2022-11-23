import 'package:get/get.dart';

enum AppBarState { members, menu, transaction, recap, settings }

enum CartModeState { on, off }

class HomeController extends GetxController {
  final Rx<AppBarState> _appbarState = AppBarState.transaction.obs;
  AppBarState get appbarState => _appbarState.value;

  final Rx<CartModeState> _cartModeState = CartModeState.off.obs;
  CartModeState get cartModeState => _cartModeState.value;
  bool get isCartMode => _cartModeState.value == CartModeState.on;

  // ? ----------------------------------appbarStates

  goDashboard() {
    _appbarState.value = AppBarState.members;
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

  goToRecap() {
    _appbarState.value = AppBarState.recap;
  }

  startShopping() {
    _cartModeState.value = CartModeState.on;
  }

  cancelShopping() {
    _cartModeState.value = CartModeState.off;
  }

  // ? ---------------------------end of appbarStates
}
