import 'package:fluttertoast/fluttertoast.dart';
import 'package:pp_cashier/consts/theme.const.dart';

class ToastHelper {
  ToastHelper._();

  static void success(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: cGreen1,
      textColor: cWhite1,
      webBgColor: '#53C2A1',
      fontSize: 16.0,
    );
  }

  static void error(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: cRed1,
      textColor: cWhite1,
      webBgColor: '#E85656',
      fontSize: 16.0,
    );
  }

  static void warning(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: cYellow1,
      textColor: cWhite1,
      webBgColor: '#FF9D2B',
      fontSize: 16.0,
    );
  }
}
