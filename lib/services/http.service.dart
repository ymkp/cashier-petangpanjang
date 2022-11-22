import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/state_manager.dart';
import 'package:pp_cashier/utils/logger.dart';
import 'package:pp_cashier/utils/string.helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const int timeoutSeconds = 30;

class HTTPService extends GetxService {
  HTTPService() {
    url = dotenv.env['URL'] ?? '';
    Logg.loggerprint('http service initiated : $url');
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

  /// process resopnse, try to catch known errors
  dynamic _processResponse(http.Response response) {
    Logg.loggerprint('${response.request!.url} ${response.request?.method}');
    Logg.loggerprint('${response.statusCode} : ${response.body}');

    final res = response.body == 'ok' ? {} : json.decode(response.body);
    if ([200, 201].contains(response.statusCode)) {
      return res;
    } else {
      String errMsg = '';
      String thrownMsg = '';
      try {
        errMsg = res['error']['message'];
      } catch (e) {
        Logg.loggerprint('failed to catch error msg', error: e);
      }
      switch (errMsg) {
        case 'Not Found':
          thrownMsg = 'Tidak ditemukan';
          break;
        default:
          thrownMsg = errMsg;
          break;
      }
      throw thrownMsg;
    }
  }
}
