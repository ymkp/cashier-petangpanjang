import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/state_manager.dart';
import 'package:pp_cashier/utils/logger.helper.dart';
import 'package:pp_cashier/utils/string.helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pp_cashier/utils/toast.helper.dart';

const int timeoutSeconds = 30;

class HTTPService extends GetxService {
  HTTPService() {
    url = dotenv.env['URL'] ?? '';
    LoggerHelper.log('http service initiated : $url');
  }

  late final String url;

  Future<dynamic> get({
    required String route,
    Map<String, String>? header,
    Map<String, dynamic>? query,
  }) async {
    Map<String, String> h = {
      'Content-Type': 'application/json',
    };
    if (header != null && header.isNotEmpty) {
      h.addAll(header);
    }
    final q = query ?? {};
    final res = await http
        .get(
          Uri.parse('$url$route${getQueryStringFromMap(q)}'),
          headers: h,
        )
        .timeout(const Duration(seconds: timeoutSeconds));
    return _processResponse(res);
  }

  Future<dynamic> post({
    required String route,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Map<String, String> h = {
      'Content-Type': 'application/json',
    };
    if (header != null && header.isNotEmpty) {
      h.addAll(header);
    }
    final q = query ?? {};
    final res = await http
        .post(
          Uri.parse('$url$route${getQueryStringFromMap(q)}'),
          headers: h,
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: timeoutSeconds));
    return _processResponse(res);
  }

  Future<dynamic> patch({
    required String route,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Map<String, String> h = {
      'Content-Type': 'application/json',
    };
    if (header != null && header.isNotEmpty) {
      h.addAll(header);
    }
    final q = query ?? {};
    LoggerHelper.log(body.toString());
    final res = await http
        .patch(
          Uri.parse('$url$route${getQueryStringFromMap(q)}'),
          headers: h,
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: timeoutSeconds));
    return _processResponse(res);
  }

  /// process resopnse, try to catch known errors
  dynamic _processResponse(http.Response response) {
    LoggerHelper.log('${response.request!.url} ${response.request?.method}');
    LoggerHelper.log('${response.statusCode} : ${response.body}');

    final res = response.body == 'ok' ? {} : json.decode(response.body);
    if ([200, 201].contains(response.statusCode)) {
      return res;
    } else {
      String errMsg = '';
      String thrownMsg = '';
      try {
        errMsg = res['error']['message'];
      } catch (e) {
        LoggerHelper.log('failed to catch error msg', error: e);
      }
      switch (errMsg) {
        case 'Not Found':
          thrownMsg = 'Tidak ditemukan';
          ToastHelper.error(thrownMsg);
          break;
        default:
          thrownMsg = errMsg;
          ToastHelper.error(thrownMsg);
          break;
      }
      throw thrownMsg;
    }
  }
}
