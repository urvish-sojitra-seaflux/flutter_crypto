import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/base/utils/dialog_utils.dart';

Future<void> handleHttpError(DioError e) async {
  switch (e.type) {
    case DioErrorType.connectTimeout:
      showAlertDialog(message: "Poor internet connection");
      break;
    case DioErrorType.response:
      if (e.response?.statusCode == 401) {
        showAlertDialog(message: e.response?.data["message"] ?? "");
      } else {
        showAlertDialog(message: e.response?.data["message"] ?? "");
      }
      break;
    default:
      showAlertDialog(message: e.error ?? "");
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  showAlertDialog(
      message: "No internet connection. Please check your internet connection");
  return false;
}
